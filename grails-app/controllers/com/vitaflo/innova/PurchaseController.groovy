package com.vitaflo.innova
import grails.converters.JSON


class PurchaseController extends BaseController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        rememberListState([max: 15, offset: 0, sort: 'expireDate', order: 'desc'])

        def query = {

			if(params.codeNumber) {
                eq('codeNumber', params.codeNumber)
            }

            if(params.supplier) {
                supplier {
                    eq('name', params.supplier)
                }
            }

            if(params.status) {
                eq('status', params.status)
            }
        }

        def criteria = Purchase.createCriteria()

        def total = criteria.count(query)

        def purchases = Purchase.withCriteria{

            maxResults(params.max?.toInteger())
            firstResult(params.offset?.toInteger())
            order(params.sort, params.order)

            if(params.codeNumber) {
                eq('codeNumber', params.codeNumber)
            }

            if(params.supplier) {
                supplier {
                    eq('name', params.supplier)
                }
            }

            if(params.status) {
                eq('status', params.status)
            }

        }
		
        [purchaseInstanceList: purchases, purchaseInstanceTotal: total, codeNumber:params.codeNumber, supplier:params.supplier, status:params.status]
    }

    def create = {
        def purchaseInstance = new Purchase()
        purchaseInstance.properties = params

        return [purchaseInstance: purchaseInstance]
    }

    def save = { UpdatePurchaseDetailsListCommand updateCommand ->

        def purchaseInstance = new Purchase(params)
		
        List purchaseDetailList = updateCommand.createPurchaseDetailsList()

        purchaseDetailList.each {purchaseDetail ->
            purchaseInstance.addToDetails(purchaseDetail)
        }

        if (!purchaseInstance.hasErrors()){

            if (purchaseInstance.save()){
                flash.message = "purchase.created"
                flash.args = [purchaseInstance.id]
                flash.defaultMessage = "purchase ${purchaseInstance.id} created"
                redirect(action: "show", id: purchaseInstance.id)
            }
        }

        render(view: "create", model: [purchaseInstance: purchaseInstance, purchaseDetailList: purchaseDetailList])
        
    }

    def show = {
        def purchaseInstance = Purchase.get(params.id)
        if (!purchaseInstance) {
            flash.message = "purchase.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Purchase not found with id ${params.id}"
            redirect(action: "list")
        } 
        return [purchaseInstance: purchaseInstance]
    }

    def edit = {
        def purchaseInstance = Purchase.get(params.id)
        if (!purchaseInstance) {
            flash.message = "purchase.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Purchase not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
			def purchaseDetailList = purchaseInstance.details
            return [purchaseInstance: purchaseInstance, purchaseDetailList:purchaseDetailList]
        }
    }

    def update = { UpdatePurchaseDetailsListCommand updateCommand ->
		
        def purchaseInstance = Purchase.get(params.id)

        if (purchaseInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (purchaseInstance.version > version) {
                    
                    purchaseInstance.errors.rejectValue("version", "purchase.optimistic.locking.failure", "Another user has updated this Purchase while you were editing")
                    render(view: "edit", model: [purchaseInstance: purchaseInstance])
                    return
                }
            }
            purchaseInstance.properties = params

            //We need to apply the delete manually as the update provided by the scaffolding didn't work out of the box with sets.
			
			List updatedDetailList = updateCommand.createPurchaseDetailsList()

			updatedDetailList.each { updateDetail ->
				if (updateDetail.id){
					def auxPurchaseDetail = purchaseInstance.details.find{it.id == updateDetail.id}
					auxPurchaseDetail.quantity = updateDetail.quantity
					auxPurchaseDetail.price = updateDetail.price
					auxPurchaseDetail.product = updateDetail.product
					auxPurchaseDetail.lot = updateDetail.lot
					auxPurchaseDetail.expiredDate = updateDetail.expiredDate
				}
            }
			
            List removeDetails = []
            
            purchaseInstance.details.each { purchaseDetail ->
                def auxUpdatedDetail = updatedDetailList.find{it.id == purchaseDetail.id}
                if (!auxUpdatedDetail){
                    removeDetails.add(purchaseDetail)
                }
            }
			
              removeDetails.each { detailToRemove ->
                purchaseInstance.removeFromDetails(detailToRemove)
            }
			  
			updatedDetailList.each {updatedDetail ->
				  if (updatedDetail.id == null){
					  purchaseInstance.addToDetails(updatedDetail)
				  }
			}
            //End of the manual removal
            
            if (!purchaseInstance.hasErrors() && purchaseInstance.save(flush:true)) {
                purchaseInstance.clearErrors()
                flash.message = "purchase.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Purchase ${params.id} updated"
                redirect(action: "show", id: purchaseInstance.id)
            }
            else {
                render(view: "edit", model: [purchaseInstance: purchaseInstance])
            }
        }
        else {
            flash.message = "purchase.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Purchase not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def purchaseInstance = Purchase.get(params.id)
        if (purchaseInstance) {
            try {
                def invoiceList = []
                
                purchaseInstance.invoices.each {invoice ->
                    invoiceList.add(invoice)
                }

                invoiceList.each {invoice ->
                    purchaseInstance.removeFromInvoices(invoice)
                }
                
                purchaseInstance.delete()
                flash.message = "purchase.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Purchase ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "purchase.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Purchase ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "purchase.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Purchase not found with id ${params.id}"
            redirect(action: "list")
        }
    }

	def addDetail = { UpdatePurchaseDetailsListCommand updateCommand, AddPurchaseDetailsListCommand addCommand ->
		List purchaseDetailList = updateCommand.createPurchaseDetailsList()
		
		if (!addCommand.hasErrors()){
			def purchaseDetail = addCommand.createNewPurchaseDetail()
			purchaseDetailList.add(purchaseDetail)
			def amount = 0
			purchaseDetailList.each{purchaseDetailItem -> amount += (purchaseDetailItem.price * purchaseDetailItem.quantity)}
			render (template:"purchaseDetailList", model:[purchaseDetailList:purchaseDetailList, amount:amount])
		}else{
			addCommand.updateAddProductPrice()
			render (template:"purchaseDetailList", model:[addCommand:addCommand, purchaseDetailList:purchaseDetailList, amount:params.amount])
		}
	}


	def removeDetail = { UpdatePurchaseDetailsListCommand updateCommand ->
		List purchaseDetailList = updateCommand.createPurchaseDetailsList()
		int i = params.id.toInteger()
		purchaseDetailList.remove(i)
		def amount = 0
		purchaseDetailList.each{purchaseDetailItem -> amount += (purchaseDetailItem.price * purchaseDetailItem.quantity)}
		render (template:"purchaseDetailList", model:[purchaseDetailList:purchaseDetailList, amount:amount])
	}

    def addInvoiceForCreate = { PurchaseInvoicesCommand invoicesCmd ->
        def purchaseInstance = new Purchase(params)       

        def invoicesList = invoicesCmd.createAnInvoiceList()
        purchaseInstance.invoices = invoicesList

        addInvoice(purchaseInstance)

		def invoices = getInvoicesForSelect()
		invoices -= purchaseInstance.invoices
		
        purchaseInstance.invoices*.discard()
        render(view: "create", model: [purchaseInstance: purchaseInstance, invoices:invoices])
    }

    def removeInvoiceForCreate = {PurchaseInvoicesCommand invoicesCmd ->
        def purchaseInstance = new Purchase(params)

        def invoicesList = invoicesCmd.createAnInvoiceList()
        purchaseInstance.invoices = invoicesList

        removeInvoice(purchaseInstance)

        purchaseInstance.invoices*.discard()

		def invoices = getInvoicesForSelect()
		
        render(view: "create", model: [purchaseInstance: purchaseInstance, invoices:invoices])
    }

    def addInvoiceForUpdate = {
        def purchaseInstance = Purchase.get(params.id)
        purchaseInstance.properties = params

        addInvoice(purchaseInstance)

		def invoices = getInvoicesForSelect()
		invoices -= purchaseInstance.invoices
        render(view: "edit", model: [purchaseInstance: purchaseInstance, invoices:invoices])
    }

    def removeInvoiceForUpdate = {
        def purchaseInstance = Purchase.get(params.id)
        purchaseInstance.properties = params

        removeInvoice(purchaseInstance)

		def invoiceId = params.invoiceToRemove
		def invoice = Invoice.get(invoiceId)
		
		def invoices = getInvoicesForSelect()
		invoices.add(invoice)
		invoices.sort {it.number}
        render(view: "edit", model: [purchaseInstance: purchaseInstance, invoices:invoices])
    }


    void addInvoice(Purchase purchaseInstance){

        def invoice = Invoice.get(params.invoiceSelected)
        purchaseInstance.addToInvoices(invoice)

        def updatedAmount = purchaseInstance.amount?purchaseInstance.amount + invoice.amount:invoice.amount
        purchaseInstance.amount = updatedAmount < 0? invoice.amount : updatedAmount
    }

    void removeInvoice(Purchase purchaseInstance){

        def invoiceId = params.invoiceToRemove

        def invoice = Invoice.get(invoiceId)
        purchaseInstance.removeFromInvoices(invoice)

        def updatedAmount = purchaseInstance.amount?purchaseInstance.amount - invoice.amount:0
        purchaseInstance.amount = updatedAmount < 0? 0 : updatedAmount
    }


    def updateExpireDate ={
        def supplierPeriod = Supplier.PAYMENT_CONDITION_PERIOD
        def auxCreationDate = new Date()

        def auxSupplierId = params.supplierId

        if (params.creationDate_year != '' && params.creationDate_day != '' && params.creationDate_month != ''){
            def auxCreationCalendar = new GregorianCalendar()
            auxCreationCalendar.set(params.creationDate_year.toInteger(), (params.creationDate_month.toInteger() - 1),params.creationDate_day.toInteger())
            auxCreationDate = auxCreationCalendar.getTime()
        }

        if (auxSupplierId != '' && auxSupplierId != 'null'){
            def auxSupplier = Supplier.get(auxSupplierId)
            if (auxSupplier && auxSupplier.getPaymentConditionPeriod()){
                supplierPeriod = auxSupplier.getPaymentConditionPeriod()
            }
        }

        def expireDateUpdated = auxCreationDate + supplierPeriod
        //Setting this format so it can be parse by JavaScript Date  Object
        //See more at:
        //https://developer.mozilla.org/en/Core_JavaScript_1.5_Reference/Global_Objects/Date/parse
        render formatDate(date:expireDateUpdated, format:"MMM d, yyyy")
    }
	
	private getInvoicesForSelect(){
		return Invoice.withCriteria{
			order('number', 'asc')
			isNull('purchase')
			purchase{
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
	
    def updatePrice ={
        double price = 0d
        if (params.addProductId != ''){
            def auxProduct = Product.get(params.addProductId)
            price = auxProduct.getBuyPrice()
        }
        
        render formatNumber(number:price,format:"#.##")
    }

		
}

class PurchaseInvoicesCommand{
    List invoicesCommand = []

    List createAnInvoiceList(){
        List invoiceList = []

        invoicesCommand.each { invoiceId ->
            def anInvoice = Invoice.get(invoiceId)
            invoiceList.add(anInvoice)
        }
        
        return invoiceList
    }
}

class AddPurchaseDetailsListCommand {
	Long addProductId
	Integer addQuantity
	Double addPrice
	String addLot
	Date addExpiredDate


	static constraints = {
		addProductId(nullable:false)
		addQuantity(nullable:false, min:1)
		addPrice(nullable:false, min:0d)
		addLot(nullable:true)
		addExpiredDate(nullable:true)
	}

	ProductStock createNewPurchaseDetail(){
		def auxProduct = Product.get(addProductId)
		def purchaseDetail = new ProductStock(product:auxProduct, quantity:addQuantity, price:addPrice, lot:addLot, expiredDate: addExpiredDate)

		return purchaseDetail
	}

	void updateAddProductPrice(){

		addPrice = 0d
		if (addProductId != null && addProductId != ''){
			def auxProduct = Product.get(addProductId)
			addPrice = auxProduct.getBuyPrice()
		}
	}

}


class UpdatePurchaseDetailsListCommand {
	List productIds = []
	List quantities = []
	List detailsIds = []
	List prices = []
	List lots = []
	List expiredDates = []
	

	List createPurchaseDetailsList(){
		List purchaseDetailList = []
		productIds.eachWithIndex(){ productId, i->
			def auxProduct = Product.get(productId)
			def purchaseDetail = new ProductStock(product:auxProduct, quantity:quantities[i], price:prices[i].replace(',','.').toDouble(), lot:lots[i], expiredDate: expiredDates[i])
			if(detailsIds[i]!=''){
				purchaseDetail.id = detailsIds[i].toLong()
			}
			purchaseDetailList.add(purchaseDetail)
		}

		return purchaseDetailList
	}
}
