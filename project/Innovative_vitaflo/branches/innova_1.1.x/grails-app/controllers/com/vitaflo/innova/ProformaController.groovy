package com.vitaflo.innova
import grails.converters.JSON
class ProformaController extends BaseController {

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def mailService

    def index = { redirect(action: "list", params: params) }

    def list = {
        rememberListState([max: 15, offset: 0, sort: 'id', order: 'desc'])

        def query = {

            if(params.status) {
                eq('status', params.status)
            }
            if(params.client && params.patient){
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
              if(params.client) {
                client {
                    eq('name', params.client)

                    inList('country', session.countries)
                }
              } else
                if(params.patient){
                patient {
                    def str = params.patient.split(',')
                    eq('lastName', str[0])

                    inList('country', session.countries)
                }
                } else {
                or{
                    client {
                        if(params.client){
                            eq('name', params.client)
                        }

                        inList('country', session.countries)
                    }
                    patient {
                        if(params.patient){
                            def str = params.patient.split(',')
                            eq('lastName', str[0])
                        }
                        inList('country', session.countries)
                    }

                }
            }
        }

        def criteria = Proforma.createCriteria()
        def total = criteria.count(query)
        
        def proformas = Proforma.withCriteria {
            maxResults(params.max?.toInteger())
            firstResult(params.offset?.toInteger())
            order(params.sort, params.order)
            
          if(params.status) {
              eq('status', params.status)
          }
          if(params.client && params.patient){
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
            if(params.client) {
              client {
                  eq('name', params.client)
                  inList('country', session.countries)
              }
            } else
              if(params.patient){
              patient {
                  def str = params.patient.split(',')
                  eq('lastName', str[0])
                  inList('country', session.countries)
              }
              } else {
              or{
                  client {
                      if(params.client){
                          eq('name', params.client)
                      }
                      inList('country', session.countries)
                  }
                  patient {
                      if(params.patient){
                          def str = params.patient.split(',')
                          eq('lastName', str[0])
                      }
                      inList('country', session.countries)
                  }

              }
          }
      }
        [proformaInstanceList: proformas, proformaInstanceTotal: total, client: params.client, patient: params.patient, status: params.status]
    }

    private getPatientsForSelectList() {
        Patient.withCriteria {
            ne('status', 'Deleted')
            inList('country',session.countries)
            order("lastName", "asc")
            order("firstName", "asc")
            order("initials", "asc")
        }
    }
    
    private getClientsForSelectList() {
         Client.withCriteria {
            ne('status', 'Deleted')
            inList('country',session.countries)
            order("name", "asc")
        }
    }

    def create = {
        def proformaInstance = new Proforma()
        proformaInstance.properties = params

        def patients = getPatientsForSelectList()
        
        def clients = getClientsForSelectList()

        return [proformaInstance: proformaInstance, patients: patients, clients: clients]
    }


    def save = { UpdateProformaDetailsListCommand updateCommand ->

        def proformaInstance = new Proforma(params)
        List proformaDetailList = updateCommand.createProformaDetailsList()

        proformaDetailList.each {proformaDetail ->
            proformaInstance.addToDetails(proformaDetail)
        }

        if (!proformaInstance.hasErrors()){

            if (proformaInstance.save()){
                //update the patient with the client selected in the proforma
                updatePatient(proformaInstance)
                flash.message = "proforma.created"
                flash.args = [proformaInstance.id]
                flash.defaultMessage = "Proforma ${proformaInstance.id} created"
                redirect(action: "show", id: proformaInstance.id)
            }
        }

        def patients = getPatientsForSelectList()

        def clients = getClientsForSelectList()

        render(view: "create", model: [proformaInstance: proformaInstance, proformaDetailList: proformaDetailList, patients:patients, clients:clients])
    }

    def addBatch = {
        def proformaInstance = Proforma.get(params.id)
        if (!proformaInstance) {
            flash.message = "proforma.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Proforma not found with id ${params.id}"
            redirect(action: "list")
        }

        def batchNumbers = []
        proformaInstance.details.eachWithIndex{obj, i->
            batchNumbers[i] = obj.lot
        }

        AddBatchNumberCommand addBatchCmd = new AddBatchNumberCommand(invoiceId: params.invoiceId, batchNumbers:batchNumbers)
        render(view:'addBatch', model:[proformaInstance: proformaInstance, addBatchCmd:addBatchCmd])
    }

    def updateBatch = {AddBatchNumberCommand addBatchCmd ->
        def proformaInstance = Proforma.get(params.id)
        
        if (!proformaInstance) {
            flash.message = "proforma.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Proforma not found with id ${params.id}"
            redirect(controller:"invoice", action: "list")
        }
        
        //If a new product was added to the promforma while were editing the batch numbers an error is thrown.
        if (proformaInstance.details.size() != addBatchCmd.batchNumbers.size()) {
            proformaInstance.errors.rejectValue("version", "proforma.optimistic.locking.failure", "Another user has updated this Proforma while you were editing")
            def proformaDetailList = proformaInstance.details
            redirect(action:"addBatch",  id: proformaInstance.id)
        }

        //Updating the batch numbers in the proforma
        proformaInstance.details.eachWithIndex{obj, i->
            obj.lot = addBatchCmd.batchNumbers[i]
        }

        //Persisting the proforma
        if (!proformaInstance.hasErrors() && proformaInstance.save()) {
            flash.message = "batch.updated"
            flash.args = [params.id]
            flash.defaultMessage = "Batch number for proforma ${params.id} updated"
            redirect(controller:"invoice", action: "show", id: addBatchCmd.invoiceId)
        }
        
        render(view:'addBatch', model:[proformaInstance: proformaInstance, addBatchCmd:addBatchCmd])
    }


    def show = {
        def proformaInstance = Proforma.get(params.id)
        if (!proformaInstance) {
            flash.message = "proforma.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Proforma not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            //Total Details
            Double totalDetails = proformaInstance.getTotalDetails();

            //Total Amount
            Double totalAmount = (!proformaInstance.donation)?proformaInstance.getTotalAmount():0.0;

            //Discount Amount
            Double discountAmount = proformaInstance.getDiscountAmount();

            return [proformaInstance: proformaInstance, totalDetails:totalDetails, totalAmount:totalAmount, discountAmount: discountAmount]
        }
    }

    def proformaEmail = {
        def proformaInstance = Proforma.get(params.id)

        if (!proformaInstance) {
            flash.message = "proforma.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Proforma not found with id ${params.id}"
            redirect(action: "list")
        }

        //Total Details
        def totalDetails = proformaInstance.getTotalDetails();

        //Total Amount
        def totalAmount = (!proformaInstance.donation)?proformaInstance.getTotalAmount():0;

        //Discount Amount
        def discountAmount = proformaInstance.getDiscountAmount();
        
        //Cliente email
        def clientEmail = proformaInstance.client.email

        render(view:'sendEmail', model:[proformaInstance: proformaInstance, totalDetails:totalDetails,
                totalAmount:totalAmount, discountAmount: discountAmount, clientEmail:clientEmail])
        
    }

    def printProforma = {
      def proformaInstance = Proforma.get(params.id)

      if (!proformaInstance) {
          flash.message = "proforma.not.found"
          flash.args = [params.id]
          flash.defaultMessage = "Proforma not found with id ${params.id}"
          redirect(action: "list")
      }

      //Total Details
      def totalDetails = proformaInstance.getTotalDetails();

      //Total Amount
      def totalAmount = (!proformaInstance.donation)?proformaInstance.getTotalAmount():0;

      //Discount Amount
      def discountAmount = proformaInstance.getDiscountAmount();

      render(view:'print', model:[proformaInstance: proformaInstance, totalDetails:totalDetails,
              totalAmount:totalAmount, discountAmount: discountAmount])

    }
  
    def sendProformaEmail = {SendEmailCommand emailCmd ->

        def proformaInstance = Proforma.get(params.id)

        //Total Details
        def totalDetails = proformaInstance.getTotalDetails();
        //Total Amount
        def totalAmount = (!proformaInstance.donation)?proformaInstance.getTotalAmount():0;
        //Discount Amount
        def discountAmount = proformaInstance.getDiscountAmount();

        if (!emailCmd.hasErrors()){
            try{
                mailService.sendMail {
                    to emailCmd.clientEmail
                    from grailsApplication.config.application.emailFromAddress
                    subject "Proforma ${proformaInstance.id}"
                    body (view:"/emails/${grailsApplication.config.application.template}Mail", model:[proformaInstance:proformaInstance, totalDetails:totalDetails, totalAmount:totalAmount,
                            discountAmount: discountAmount])

                    flash.message = "proforma.emailsent"
                    flash.args = [proformaInstance.id, emailCmd.clientEmail]
                    flash.defaultMessage = "Proforma ${proformaInstance.id} was sent to ${emailCmd.clientEmail}"
                    redirect(action: "show", id: proformaInstance.id)
                }
            }catch(Exception e){
                log.error "Problem sending email $e.message", e
                def args = [proformaInstance.id, emailCmd.clientEmail].toArray()
                def defaultMsg = "There was a problem sending Proforma ${proformaInstance.id} to ${emailCmd.clientEmail}"

                proformaInstance.errors.reject("proforma.emailsent.problem",args, defaultMsg)
            }
        }

        render(view:'sendEmail', model:[proformaInstance: proformaInstance, totalDetails:totalDetails,
                totalAmount:totalAmount, discountAmount: discountAmount, clientEmail:emailCmd.clientEmail])
    }


    def edit = {
        def proformaInstance = Proforma.get(params.id)
        if (!proformaInstance) {
            flash.message = "proforma.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Proforma not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            def proformaDetailList = proformaInstance.details
            def patients = getPatientsForSelectList()
            def clients = getClientsForSelectList()

            return [proformaInstance: proformaInstance, proformaDetailList:proformaDetailList, patients: patients, clients: clients]
        }
    }

    def update = {UpdateProformaDetailsListCommand updateCommand ->
        
        def proformaInstance = Proforma.get(params.id)

        if (proformaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (proformaInstance.version > version) {
                    
                    proformaInstance.errors.rejectValue("version", "proforma.optimistic.locking.failure", "Another user has updated this Proforma while you were editing")
                    def proformaDetailList = proformaInstance.details
                    
                    def patients = getPatientsForSelectList()

                    render(view: "edit", model: [proformaInstance: proformaInstance, proformaDetailList: proformaDetailList, patients:patients])
                    return
                }
            }

            proformaInstance.properties = params

            List updatedDetailList = updateCommand.createProformaDetailsList()

            updatedDetailList.each {updatedDetail ->
                if (updatedDetail.id){
                    def auxProformaDetail = proformaInstance.details.find{it.id == updatedDetail.id}
                    auxProformaDetail.quantity = updatedDetail.quantity
                    auxProformaDetail.dailyDose = updatedDetail.dailyDose
                    auxProformaDetail.doseUnit = updatedDetail.doseUnit
                    auxProformaDetail.price = updatedDetail.price
                    auxProformaDetail.product = updatedDetail.product
                }
            }

            List removeDetails = []
            
            proformaInstance.details.each { proformaDetail ->
                def auxUpdatedDetail = updatedDetailList.find{it.id == proformaDetail.id}
                if (!auxUpdatedDetail){
                    removeDetails.add(proformaDetail)
                }
            }

            removeDetails.each { detailToRemove ->
                proformaInstance.removeFromDetails(detailToRemove)
            }

            updatedDetailList.each {updatedDetail ->
                if (updatedDetail.id == null){
                    proformaInstance.addToDetails(updatedDetail)
                }
            }

            if (!proformaInstance.hasErrors() && proformaInstance.save()) {
              
                //update the patient with the client selected in the proforma
                updatePatient(proformaInstance)              
                flash.message = "proforma.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Proforma ${params.id} updated"
                redirect(action: "show", id: proformaInstance.id)
            }
            else {
                def patients = getPatientsForSelectList()
                render(view: "edit", model: [proformaInstance: proformaInstance, proformaDetailList: updatedDetailList, patients:patients])
            }
        }
        else {
            flash.message = "proforma.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Proforma not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def proformaInstance = Proforma.get(params.id)
        if (proformaInstance) {
            try {
                proformaInstance.delete()
                flash.message = "proforma.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Proforma ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "proforma.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Proforma ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "proforma.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Proforma not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def updateStatus ={
        def proformaInstance = Proforma.get(params.id)

        if(params.version) {
            if (params.version) {
                def version = params.version.toLong()
                if (proformaInstance.version > version) {

                    proformaInstance.errors.rejectValue("version", "proforma.optimistic.locking.failure", "Another user has updated this Client while you were editing")
                    redirect(action: "list", params:params)
                    return
                }
            }

        }
        
        proformaInstance.status = params.proformaStatus

        proformaInstance.save()

        def data = []
        data = [status:params.proformaStatus,proformaId:params.id]
        render data as JSON
        //redirect(action: "list", params:params)
    }
    
    def lookUpClient ={

        Double dose = 0.0
        String doseUnit
        def client = null
        if (params.patientId != 'null'){
            def patientInstance = Patient.get(params.patientId)
            client = patientInstance?.client?.id

            if(patientInstance?.dose){
                dose = patientInstance?.dose
                doseUnit = patientInstance?.doseUnit
            }
        }

        def data = []
        data = [client:client, dose:formatNumber(number:dose,format:"#.##"), doseUnit: doseUnit]
        render  data as JSON
    }

    def addDetail = { UpdateProformaDetailsListCommand updateCommand, AddProformaDetailsListCommand addCommand ->
        List proformaDetailList = updateCommand.createProformaDetailsList()
        
        if (!addCommand.hasErrors()){
            def proformaDetail = addCommand.createNewProformaDetail()
            proformaDetailList.add(proformaDetail)
            render (template:"proformaDetailList", model:[proformaDetailList:proformaDetailList])
        }else{
            addCommand.updateAddProductPrice()
            render (template:"proformaDetailList", model:[addCommand:addCommand, proformaDetailList:proformaDetailList])
        }
    }


    def removeDetail = { UpdateProformaDetailsListCommand updateCommand ->
        List proformaDetailList = updateCommand.createProformaDetailsList()
        int i = params.id.toInteger()
        proformaDetailList.remove(i)
        render (template:"proformaDetailList", model:[proformaDetailList:proformaDetailList])
    }


    def updatePrice ={
        double price = 0d
        if (params.addProductId != ''){
            def auxProduct = Product.get(params.addProductId)
            price = auxProduct.getPrice()
        }
        
        render formatNumber(number:price,format:"#.##")
    }

    void updatePatient(proformaInstance) {
        if(proformaInstance?.patient && proformaInstance?.client){
            def patient = Patient.get(proformaInstance?.patient?.id)
            def client = Client.get(proformaInstance?.client?.id)
            if(patient?.client?.id != client?.id){
                patient.client = client
                patient.save()
            }
        }
    }  
}

class AddProformaDetailsListCommand {
    Long addProductId
    Integer addQuantity
    Double addDailyDose
    String addDoseUnit
    Double addPrice


    static constraints = {
        addProductId(nullable:false)
        addQuantity(nullable:false, min:1)
        addDailyDose(nullable:true, min:0.1d)
        addDoseUnit(nullable:true, inList: com.vitaflo.innova.ProformaDetail.UNIT_LIST)
        addPrice(nullable:false, min:0d)
    }

    ProformaDetail createNewProformaDetail(){
        def auxProduct = Product.get(addProductId)
        def proformaDetail = new ProformaDetail(product:auxProduct, quantity:addQuantity, dailyDose:addDailyDose, doseUnit:addDoseUnit, price:addPrice)

        return proformaDetail
    }

    void updateAddProductPrice(){

        addPrice = 0d
        if (addProductId != null && addProductId != ''){
            def auxProduct = Product.get(addProductId)
            addPrice = auxProduct.getPrice()
        }
    }

}


class UpdateProformaDetailsListCommand {
    List productIds = []
    List quantities = []
    List dailyDoses = []
    List doseUnits = []
    List detailsIds = []
    List prices = []
    

    List createProformaDetailsList(){
        List proformaDetailList = []
        productIds.eachWithIndex(){ productId, i->
            def auxProduct = Product.get(productId)
            def proformaDetail = new ProformaDetail(product:auxProduct, quantity:quantities[i], dailyDose:(dailyDoses[i])? dailyDoses[i].replace(',','.').toDouble():null, doseUnit: doseUnits[i], price:prices[i].replace(',','.').toDouble())
            if(detailsIds[i]!=''){
                proformaDetail.id = detailsIds[i].toLong()
            }
            proformaDetailList.add(proformaDetail)
        }

        return proformaDetailList
    }
}


class SendEmailCommand {
    String clientEmail

    static constraints = {
        clientEmail(email:true, blank:false)
    }

}

class AddBatchNumberCommand {
    def invoiceId
    List batchNumbers = []
}
