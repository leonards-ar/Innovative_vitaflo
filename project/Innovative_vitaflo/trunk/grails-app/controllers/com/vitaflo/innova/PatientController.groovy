package com.vitaflo.innova

class PatientController extends BaseController {
	def patientProductStockService
	
	def index = { redirect(action: "list", params: params) }
	
	// the delete, save and update actions only accept POST requests
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def list = {
		rememberListState([max: 15, offset: 0, sort: 'lastName', order: 'asc'])
		def criteria = Patient.createCriteria()
		
		
		def patients = criteria.list(max:params.max?.toInteger(),offset:params.offset?.toInteger() ) {
			ne('status', 'Deleted')
			
			if (params.sort == 'clientName') {
				client { order('name', params.order)
				}
			} else{
				order(params.sort, params.order)
			}
			
			if(params.patient) {
				or{
					like('lastName', '%' + params.patient + '%')
					like('firstName', '%' + params.patient+ '%')
				}
			}
			
			if(params.patientInitials) {
				like('initials', params.patientInitials + '%')
			}

			if(params.selectedCountry){
				country{
					eq('code', params.selectedCountry)
				}
			} else {
				inList('country',session.countries)
			}
			
			if(params.client) {
				client{
					like('name', '%' + params.client + '%')
				}
			}
            if(params.pathology) {
				pathologies {
					like('name', params.pathology + '%')
				}
            }
		}
		
		patients.each{patient ->
			patient.indicator = getIndicator(patient)
		}
		
		[patientInstanceList: patients, patientInstanceTotal: patients.totalCount, client: params.client, patient:params.patient, selectedCountry: params.selectedCountry, pathology: params.pathology]
	}
	
	private getClientsForSelectList(country) {
		Client.withCriteria {
			ne('status', 'Deleted')
			eq('country',country)
			order("name", "asc")
		}
	}
	
	private getPathologiesForSelectList(country) {
		Pathology.withCriteria {
			order("name", "asc")
		}
	}
	
	private getIndicator(patient) {
		def patientProductStocksToNotify = []
		def today = new Date()
		
		patientProductStocksToNotify.addAll(
				
				PatientProductStock.executeQuery(
				"select p.product as product,max(p.runningOutOfStockDate) as runningOutOfDate from PatientProductStock p where p.next is null and p.patient.id=? group by p.product.drug",
				[patient.id])
				
				)
		
		//if patient is not registered then don't show anything
		if(!patientProductStocksToNotify) {
			if(!patient.isRegularDose()) return "yellow"
			return "none"
		}
		
		// if patient has ran out of medicine, then show it in red.
		if(patientProductStocksToNotify.findAll{item -> item[1] <= today}.size() > 0) return "red"
		
		// if patient will run out of medicine then show in yellow.
		if(patientProductStocksToNotify.findAll{item ->
			def product = item[0]
			def deliveryPeriod = product?.deliveryPeriod != null ? product?.deliveryPeriod : 0
			item[1] <= (today + deliveryPeriod)
		}.size() > 0 || !patient.isRegularDose()) return  "yellow"
	
		// if none of the others are shown, then the patient is ok.
		return  "green"
		
	}
	
	def create = {
		def patientInstance = new Patient()
		patientInstance.properties = params
		
		def clientList = getClientsForSelectList(session.countries[0])
		def pathologyList = getPathologiesForSelectList(session.countries[0])
		
		return [patientInstance: patientInstance, clientList: clientList, pathologyList: pathologyList]
	}
	
	def save = {
		def patientInstance = new Patient(params)
		
		if(!patientInstance.hasErrors()) {
			addPathologies(patientInstance)
		}
		
		if (!patientInstance.hasErrors() && patientInstance.save()) {
			flash.message = "patient.created"
			flash.args = [patientInstance.id]
			flash.defaultMessage = "Patient ${patientInstance.id} created"
			redirect(action: "show", id: patientInstance.id)
		}
		else {
			def clientList = getClientsForSelectList(patientInstance.country)
			def pathologyList = getPathologiesForSelectList(patientInstance.country)
			
			render(view: "create", model: [patientInstance: patientInstance, clientList: clientList, pathologyList: pathologyList])
		}
	}
	
	def show = {
		def patientInstance = Patient.get(params.id)
		if (!patientInstance) {
			flash.message = "patient.not.found"
			flash.args = [params.id]
			flash.defaultMessage = "Patient not found with id ${params.id}"
			redirect(action: "list")
		}
		else {
			def patientProductStockList = []
			//this query gets last orderded date and the last runningOutOfStockDate
			// suppose that exists for a product to entries
			def productStartDate =  PatientProductStock.executeQuery("select p.product, max(p.startDate) from PatientProductStock p where p.next is null and p.patient = ? group by p.product", [patientInstance])
			
			productStartDate.each{ item ->
				patientProductStockList.addAll(PatientProductStock.withCriteria {
					eq("startDate", item[1])
					patient {
						eq("id",patientInstance.id)
					}
					product{
						eq("id",item[0].id)
					}
			})
		}
			
			
			def productIndicator = []
			def today = new Date()
			patientProductStockList.each { patientProductStock->
				def deliveryPeriod = (patientProductStock?.product?.deliveryPeriod != null)? patientProductStock.product.deliveryPeriod : 0
				if( patientProductStock.runningOutOfStockDate <= today) productIndicator.add("red")
				else if(patientProductStock.runningOutOfStockDate <= (today + deliveryPeriod)) productIndicator.add("yellow")
				else productIndicator.add("green")
			}
			patientInstance.pathology
			return [patientInstance: patientInstance, productStockList:patientProductStockList, productIndicator:productIndicator]
		}
	}
	
	def edit = {
		def patientInstance = Patient.get(params.id)
		if (!patientInstance) {
			flash.message = "patient.not.found"
			flash.args = [params.id]
			flash.defaultMessage = "Patient not found with id ${params.id}"
			redirect(action: "list")
		}
		else {
			def clientList = getClientsForSelectList(patientInstance.country)
			def pathologyList = getPathologiesForSelectList(patientInstance.country)
			return [patientInstance: patientInstance, clientList: clientList, pathologyList: pathologyList]
		}
	}
	
	def update = {
		def patientInstance = Patient.get(params.id)
		if (patientInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (patientInstance.version > version) {
					
					patientInstance.errors.rejectValue("version", "patient.optimistic.locking.failure", "Another user has updated this Patient while you were editing")
					render(view: "edit", model: [patientInstance: patientInstance])
					return
				}
			}
			patientInstance.properties = params
	
			if(!patientInstance.hasErrors()) {
				addPathologies(patientInstance)
			}
			
			if (!patientInstance.hasErrors() && patientInstance.save()) {
				flash.message = "patient.updated"
				flash.args = [params.id]
				flash.defaultMessage = "Patient ${params.id} updated"
				redirect(action: "show", id: patientInstance.id)
			}
			else {
				def clientList = getClientsForSelectList(patientInstance.country)
				def pathologyList = getPathologiesForSelectList(patientInstance.country)
				render(view: "edit", model: [patientInstance: patientInstance, clientList: clientList, pathologyList: pathologyList])
			}
		}
		else {
			flash.message = "patient.not.found"
			flash.args = [params.id]
			flash.defaultMessage = "Patient not found with id ${params.id}"
			redirect(action: "edit", id: params.id)
		}
	}
	
	def delete = {
		def patientInstance = Patient.get(params.id)
		if (patientInstance) {
			try {
				//patientInstance.delete()
				patientInstance.status = 'Deleted'
				if(patientInstance.save()) {
					flash.message = "patient.deleted"
					flash.args = [params.id]
					flash.defaultMessage = "Patient ${params.id} deleted"
					redirect(action: "list")
				} else {
					flash.message = "patient.not.deleted"
					flash.args = [params.id]
					flash.defaultMessage = "Patient ${params.id} could not be deleted"
					redirect(action: "show", id: params.id)
				}
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "patient.not.deleted"
				flash.args = [params.id]
				flash.defaultMessage = "Patient ${params.id} could not be deleted"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "patient.not.found"
			flash.args = [params.id]
			flash.defaultMessage = "Patient not found with id ${params.id}"
			redirect(action: "list")
		}
	}
	
	def searchAutocomplete = {
		def patients = Patient.withCriteria{
			ne('status', 'Deleted')
			or{
				like('lastName', '%' + params.patient + '%')
				like('firstName', '%' + params.patient + '%')
				like('initials', '%' + params.patient + '%')
			}
			
			inList('country', session.countries)
		}
		
		StringBuffer idList = new StringBuffer()
		idList.append('<ul>')
		
		patients?.each{p -> idList.append('<li>' + p + '</li>')
		}
		
		idList.append('</ul>')
		
		render idList.toString()
	}
	
	def searchAutocompletePathology = {
        def pathologies = Patient.executeQuery("select p.name from Pathology p where p.name like ?", ["%" + params.pathology + "%"])
		
		StringBuffer idList = new StringBuffer()
		idList.append('<ul>')
		
		pathologies?.each{p -> idList.append('<li>' + p + '</li>')
		}
		
		idList.append('</ul>')
		
		render idList.toString()
	}
	
	private void addPathologies(patient) {
		// This fixes the problem when only one pathology is selected and it has two digits.
		if(!params.selectedPathologies) {
			patient?.pathologies?.clear()
		} else if(params.selectedPathologies instanceof String) {
			def p = Pathology.findById(params.selectedPathologies)
			if(p) {
				patient.addToPathologies(p)
			}
		} else {
			for (String key in params.selectedPathologies) {
				def p = Pathology.findById(key);
				if(p) {
					patient.addToPathologies(p)
				}
			}
		}
	}
}
