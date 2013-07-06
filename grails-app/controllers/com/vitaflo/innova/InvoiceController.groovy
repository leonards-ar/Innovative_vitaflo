package com.vitaflo.innova
import java.util.List;

import grails.converters.JSON

class InvoiceController extends BaseController {
  def patientProductStockService
  def pdfRenderingService

  def index = { redirect(action: "list", params: params) }

  // the delete, save and update actions only accept POST requests
  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def list = {
    rememberListState([max: 15, offset: 0, sort: 'date', order: 'desc'])

    def criteria = Invoice.createCriteria()

    def invoices = criteria.list(max:params.max?.toInteger(), offset:params.offset?.toInteger()) {
      order(params.sort, params.order)

      if (params.codeNumber) {
        eq('number', params.codeNumber)
      }

      if (params.status) {
        eq('status', params.status)
      }

      proforma {
        if (params.client && params.patient) {
          client {
            eq('name', params.client)

            inList('country', session.countries)
          }
          patient {
            def str = params.patient.split(',')
            eq('lastName', str[0])

            inList('country', session.countries)
          }
        } else
          if (params.client) {
            client {
              eq('name', params.client)

              inList('country', session.countries)
            }
          } else
            if (params.patient) {
              patient {
                def str = params.patient.split(',')
                eq('lastName', str[0])

                inList('country', session.countries)
              }
            } else {
              or {
                client {
                  if (params.client) {
                    eq('name', params.client)
                  }

                  inList('country', session.countries)
                }
                patient {
                  if (params.patient) {
                    def str = params.patient.split(',')
                    eq('lastName', str[0])
                  }
                  inList('country', session.countries)
                }

              }
            }
      }
    }

    [invoiceInstanceList: invoices, invoiceInstanceTotal: invoices.totalCount, codeNumber: params.codeNumber, client: params.client, patient: params.patient, status: params.status]
  }

  def create = {
    def invoiceInstance = new Invoice()
    invoiceInstance.properties = params

    List proformasToSelect = findAllProformasWithNoInvoice()

    return [invoiceInstance: invoiceInstance, proformasToSelect: proformasToSelect]
  }

  def save = {UpdateInvoiceDetailsListCommand updateCommand ->

    def invoiceInstance = new Invoice()
	List invoiceDetailList = updateCommand.createProformaDetailsList()
	
	invoiceDetailList.each{invoiceDetail ->
		def productStock = ProductStock.findAllWhere(product: invoiceDetail?.productStock?.product, lot:invoiceDetail?.productStock?.lot)
		
		invoiceInstance.addToSoldProducts(invoiceDetail)
	}
	
    // Workaround for http://jira.codehaus.org/browse/GRAILS-1793
    def excludes = []
    if ((!params.deliveryDate_month) && (!params.deliveryDate_day) && (!params.deliveryDate_year)) {
      excludes << "deliveryDate"
    }
    bindData(invoiceInstance, params, excludes)
    // end the workaround

    if (!invoiceInstance.hasErrors() && invoiceInstance.save()) {
      //Update Stock
	  def products = invoiceInstance.products()
      if (invoiceInstance.proforma.patient) {
        patientProductStockService.updatePatientProductStock(invoiceInstance);
      }
      flash.message = "invoice.created"
      flash.args = [invoiceInstance.id]
      flash.defaultMessage = "Invoice ${invoiceInstance.id} created"
      redirect(action: "show", id: invoiceInstance.id)
    }
    else {
      List proformasToSelect = findAllProformasWithNoInvoice()
      render(view: "create", model: [invoiceInstance: invoiceInstance, invoiceDetailList:invoiceDetailList, proformasToSelect: proformasToSelect])
    }
  }

  def show = {
    def invoiceInstance = Invoice.get(params.id)
    if (!invoiceInstance) {
      flash.message = "invoice.not.found"
      flash.args = [params.id]
      flash.defaultMessage = "Invoice not found with id ${params.id}"
      redirect(action: "list")
    }
    else {
      return [invoiceInstance: invoiceInstance]
    }
  }

  def edit = {
    def invoiceInstance = Invoice.get(params.id)
    if (!invoiceInstance) {
      flash.message = "invoice.not.found"
      flash.args = [params.id]
      flash.defaultMessage = "Invoice not found with id ${params.id}"
      redirect(action: "list")
    }
    else {
      List proformasToSelect = findAllProformasWithNoInvoice()
      proformasToSelect.add(invoiceInstance.proforma)
      proformasToSelect.sort {it.id}
      return [invoiceInstance: invoiceInstance, proformasToSelect: proformasToSelect]
    }
  }
  
  def addDetail = { UpdateInvoiceDetailsListCommand updateCommand, AddInvoiceDetailsListCommand addCommand ->
	  List invoiceDetailList = updateCommand.createInvoiceDetailsList()
	  
	  if (!addCommand.hasErrors()){
		  def invoiceDetail = addCommand.createNewInvoiceDetail()
		  invoiceDetailList.add(invoiceDetail)
		  render (template:"invoiceDetailList", model:[invoiceDetailList:invoiceDetailList])
	  }else{
		  addCommand.updateAddProductPrice()
		  render (template:"invoiceDetailList", model:[addCommand:addCommand, invoiceDetailList:invoiceDetailList])
	  }
  }

  def update = {

    def invoiceInstance = Invoice.get(params.id)

    //Storing the original proforma to be included in the list of proformas in case
    //of a validation error.
    def originalProforma = invoiceInstance.proforma

    if (invoiceInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (invoiceInstance.version > version) {

          invoiceInstance.errors.rejectValue("version", "invoice.optimistic.locking.failure", "Another user has updated this Invoice while you were editing")
          render(view: "edit", model: [invoiceInstance: invoiceInstance])
          return
        }
      }

      // Workaround for http://jira.codehaus.org/browse/GRAILS-1793
      def excludes = []
      if ((!params.deliveryDate_month) && (!params.deliveryDate_day) && (!params.deliveryDate_year)) {
        excludes << "deliveryDate"
      }
      bindData(invoiceInstance, params, excludes)
      // end the workaround

      if (!excludes.isEmpty()) {
        invoiceInstance.deliveryDate = null
      }

      if (!invoiceInstance.hasErrors() && invoiceInstance.save()) {
        if (invoiceInstance.proforma.patient) {
          patientProductStockService.updatePatientProductStock(invoiceInstance);
        }
        flash.message = "invoice.updated"
        flash.args = [params.id]
        flash.defaultMessage = "Invoice ${params.id} updated"
        redirect(action: "show", id: invoiceInstance.id)
      }
      else {
        List proformasToSelect = findAllProformasWithNoInvoice()
        //Adding the original proforma to the list
        proformasToSelect.add(originalProforma)
        proformasToSelect.sort {it.id}
        render(view: "edit", model: [invoiceInstance: invoiceInstance, proformasToSelect: proformasToSelect])
      }
    }
    else {
      flash.message = "invoice.not.found"
      flash.args = [params.id]
      flash.defaultMessage = "Invoice not found with id ${params.id}"
      redirect(action: "edit", id: params.id)
    }
  }

  def delete = {
    def invoiceInstance = Invoice.get(params.id)
    if (invoiceInstance) {
      try {
        invoiceInstance.delete()
        flash.message = "invoice.deleted"
        flash.args = [params.id]
        flash.defaultMessage = "Invoice ${params.id} deleted"
        redirect(action: "list")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "invoice.not.deleted"
        flash.args = [params.id]
        flash.defaultMessage = "Invoice ${params.id} could not be deleted"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "invoice.not.found"
      flash.args = [params.id]
      flash.defaultMessage = "Invoice not found with id ${params.id}"
      redirect(action: "list")
    }
  }

  def List findAllProformasWithNoInvoice() {
	def invoices = Invoice.findAll()
	
    List proformasWithNoInvoice = []
    proformasWithNoInvoice = Proforma.withCriteria {
      eq('status', 'Aprobada')
	  
	  if(invoices.size() > 0) {
	      not {
	        inList('id', invoices.collect {it.proforma.id})
	      }
	  }
      or {
        patient {
          inList('country', session.countries)
        }
        client {
          inList('country', session.countries)
        }
      }
    }

    proformasWithNoInvoice.sort {it.id}
    return proformasWithNoInvoice
  }

  def lookUpAmountProforma = {
    double amount = 0d
    if (params.amountProformaId != '') {
      def auxProforma = Proforma.get(params.amountProformaId)
      amount = auxProforma.getTotalAmount()
    }

    render formatNumber(number: amount, format: "#.##")
  }
  
  def updatePrice ={
	  double price = 0d
	  List lotList
	  if (params.addProductId != ''){
		  def auxProduct = Product.get(params.addProductId)
		  lotList = getLots(auxProduct) 
		  price = auxProduct.getSelPrice()
		  
	  }
	  
	  def responseData = [price: formatNumber(number:price,format:"#.##"),lotList:lotList]
	  render responseData as JSON
  }
  
  def showProductStock = {
	  def product = Product.get(params.addProductId.toLong())
	  List queryList = ProductStock.executeQuery("select p.product, sum(p.quantity) as quantity, sum(p.sold) as sold, p.lot, p.expiredDate from ProductStock p where p.product = ? and p.quantity > p.sold and (p.expiredDate > ? or p.expiredDate is null) group by p.product,p.lot order by p.expiredDate asc", [product, Calendar.instance.getTime()])
	  List productStockList = []
	  queryList.collect{ item ->
		     def stock = new ProductStock(product:item[0],quantity:item[1],sold:item[2],lot:item[3],expiredDate:item[4])
			 productStockList.add(stock)
		  }
	  render (view: 'showProductStock', model:[productStockList: productStockList, productStockListCount: productStockList.size(), productName:product?.name])
	  
  }
  
  
  def printInvoice = {
          def invoice = Invoice.get(params.id)
          
          def proformaInstance = invoice?.proforma
          
          def clientInstance = proformaInstance?.client
          def patientInstance = proformaInstance?.patient
          
          pdfRenderingService.render(template: "/invoice/invoiceTemplate", model:[proformaInstance:proformaInstance, clientInstance: clientInstance, patientInstance: patientInstance] + [controller: this], response)
//          def fos= new FileOutputStream('NewTestFile.pdf')
//          
//            fos.write(bytes.toByteArray())
//            fos.close()
//  
//          render(template: "/invoice/invoiceTemplate", params: [clientInstance: clientInstance, patientInstance: patientInstance])
      
  }
  
  private updateStock(Invoice invoiceInstance) {
	  def products = invoiceInstance.products();
	  products.each { item ->
		  List stock = ProductStock.executeQuery("from ProductStock p where (p.expiredDate > ? or p.expiredDate is null and (p.buy-p.sold) > 0 and p.product = ? order by p.expiredDate", [Calendar.instance.getTime(), item.product])
		  print "******** stock ${stock}"
	  }
		  
  }
  
  def List getLots(Product product){
	  
	  def lotList = ProductStock.createCriteria().list{
		  projections {
			  distinct("lot")
		  }
		  eq('product', product)
		  geProperty('quantity','sold')
		  or{
			  gt('expiredDate',Calendar.instance.getTime())
			  isNull('expiredDate')
		  }

	  }
	  
	  return lotList
	  
  }
}

class AddInvoiceDetailsListCommand {
	Long addProductId
	Integer addQuantity
	Double addDailyDose
	String addDoseUnit
	String addLot
	Double addPrice


	static constraints = {
		addProductId(nullable:false)
		addQuantity(nullable:false, min:1)
		addDailyDose(nullable:true, min:0.1d)
		addLot(nullable:false)
		addDoseUnit(nullable:true, inList: com.vitaflo.innova.ProformaDetail.UNIT_LIST)
		addPrice(nullable:false, min:0d)
		
		addQuantity validator: {val, obj ->
			//def product = Product.get(obj.addProductId)
			def productStockList = ProductStock.executeQuery("select p.product, sum(p.quantity) as quantity, sum(p.sold) as sold, p.lot, p.expiredDate from ProductStock p where p.product.id = ? and p.lot = ? group by p.product,p.lot", [obj.addProductId, obj.addLot])
			def item = productStockList.get(0)
			ProductStock productStock = new ProductStock(product:item[0],quantity:item[1],sold:item[2],lot:item[3],expiredDate:item[4])
			def total = productStock?.sold + val
			
			return total <= productStock?.quantity
		}
	}

	InvoiceDetail createNewInvoiceDetail(){
		def auxProduct = Product.get(addProductId)
		def auxProductStock = ProductStock.findByProductAndLot(auxProduct, addLot)
		def invoiceDetail = new InvoiceDetail(productStock:auxProductStock, quantity:addQuantity, dailyDose:addDailyDose, doseUnit:addDoseUnit, price:addPrice)

		return invoiceDetail
	}

	void updateAddProductPrice(){

		addPrice = 0d
		if (addProductId != null && addProductId != ''){
			def auxProduct = Product.get(addProductId)
			addPrice = auxProduct.getSelPrice()
		}
	}

}

class UpdateInvoiceDetailsListCommand {
	List productIds = []
	List quantities = []
	List dailyDoses = []
	List doseUnits = []
	List lots = []
	List detailsIds = []
	List prices = []
	

	List createInvoiceDetailsList(){
		List invoiceDetailList = []
		productIds.eachWithIndex(){ productId, i->
			def auxProduct = Product.get(productId)
			def auxProductStock = ProductStock.findByProductAndLot(auxProduct, lots[i])
			def proformaDetail = new InvoiceDetail(productStock:auxProductStock, lot:lots[i],quantity:quantities[i], dailyDose:(dailyDoses[i])? dailyDoses[i].replace(',','.').toDouble():null, doseUnit: doseUnits[i], price:prices[i].replace(',','.').toDouble())
			if(detailsIds[i]!=''){
				invoiceDetail.id = detailsIds[i].toLong()
			}
			invoiceDetailList.add(proformaDetail)
		}

		return invoiceDetailList
	}
}

