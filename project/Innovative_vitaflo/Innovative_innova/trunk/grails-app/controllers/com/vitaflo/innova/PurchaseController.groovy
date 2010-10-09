package com.vitaflo.innova

class PurchaseController extends BaseController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        rememberListState([max: 15, offset: 0, sort: 'expireDate', order: 'desc'])

        def query = {
			projections {
				distinct("id")
			}
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

            invoices {
                proforma{
                    or {
                        client {
                            inList('country', session.countries)
                        }
                        patient {
                            inList('country', session.countries)
                        }

                    }
                }
            }
        }

        def criteria = Purchase.createCriteria()

        def total = criteria.count(query)

        def purchasesIds = Purchase.withCriteria{

            maxResults(params.max?.toInteger())
            firstResult(params.offset?.toInteger())
            order(params.sort, params.order)

			projections {
				distinct("id")
			}
			
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

            invoices {
                proforma{
                    or {
                        client {
                            inList('country', session.countries)
                        }
                        patient {
                            inList('country', session.countries)
                        }

                    }
                }
            }
        }
		
		def purchases = Purchase.getAll(purchasesIds)
      
        [purchaseInstanceList: purchases, purchaseInstanceTotal: total, codeNumber:params.codeNumber, supplier:params.supplier, status:params.status]
    }

    def create = {
        def purchaseInstance = new Purchase()
        purchaseInstance.properties = params
        def invoices = getInvoicesForSelect()
        return [purchaseInstance: purchaseInstance, invoices:invoices]
    }

    def save = { PurchaseInvoicesCommand invoicesCmd ->
        def purchaseInstance = new Purchase(params)

        invoicesCmd.invoicesCommand.each { invoiceId ->
            def invoice = Invoice.get(invoiceId)
            purchaseInstance.addToInvoices(invoice)
        }

        if (!purchaseInstance.hasErrors() && purchaseInstance.save()) {
            flash.message = "purchase.created"
            flash.args = [purchaseInstance.id]
            flash.defaultMessage = "Purchase ${purchaseInstance.id} created"
            redirect(action: "show", id: purchaseInstance.id)
        }
        else {
            purchaseInstance.invoices*.discard()
            render(view: "create", model: [purchaseInstance: purchaseInstance])
        }
    }

    def show = {
        def purchaseInstance = Purchase.get(params.id)
        if (!purchaseInstance) {
            flash.message = "purchase.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Purchase not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            def invoices = Invoice.withCriteria{
                order('number', 'asc')
                isNull('purchase')
                proforma{
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
            return [purchaseInstance: purchaseInstance, invoices:invoices]

        }
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
			def invoices = getInvoicesForSelect()
            return [purchaseInstance: purchaseInstance, invoices:invoices]
        }
    }

    def update = { PurchaseInvoicesCommand invoicesCmd ->
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
            def invoicesToRemove = []

            purchaseInstance.invoices.each { invoice ->
                def auxInvoiceId = invoicesCmd.invoicesCommand.find{(it.toLong()) == invoice.id}
                if (!auxInvoiceId){
                    invoicesToRemove.add(invoice)
                }
            }

            invoicesToRemove.each { invoice ->
                purchaseInstance.removeFromInvoices(auxInvoice)
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
			proforma{
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
