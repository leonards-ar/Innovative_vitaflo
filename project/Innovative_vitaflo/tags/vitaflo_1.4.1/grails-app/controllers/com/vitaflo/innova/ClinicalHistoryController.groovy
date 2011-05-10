package com.vitaflo.innova

class ClinicalHistoryController extends BaseController {
	
	def index = { redirect(action: "list", params: params) }
	
	// the delete, save and update actions only accept POST requests
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def list = {
		
		def max = Math.min(params.max ? params.max.toInteger() : 15, 100)
		def sort = params.sort ? params.sort : 'date'
		def order = params.order ? params.order : 'desc'
		def offset = params.offset ? params.offset : 0
		
		rememberListState([max: max, offset: offset, sort: sort, order: order])
		
		def patient = Patient.get(params.id)
		def clinicalHistoryList = ClinicalHistory.findAllByPatient(patient, [max: max, sort: sort, order: order, offset: offset])
		def total = ClinicalHistory.countByPatient(patient)

		render(view: "list", model: [clinicalHistoryInstanceList: clinicalHistoryList, clinicalHistoryInstanceTotal: total, patient: params.id, patientName: "${patient.lastName}, ${patient.firstName}"])
	}
	
	def create = {
		def clinicalHistoryInstance = new ClinicalHistory()
		def patient = Patient.get(params.id)
		clinicalHistoryInstance.patient = patient
		
		render(view: "create", model: [clinicalHistoryInstance: clinicalHistoryInstance])
	}
	
	def save = {
		def clinicalHistoryInstance = new ClinicalHistory()
		clinicalHistoryInstance.date = params.date
		clinicalHistoryInstance.title = params.title
		clinicalHistoryInstance.description = params.description.encodeAsHTML()
		def patient = Patient.get(params.patient)
		clinicalHistoryInstance.patient = patient
		if (!clinicalHistoryInstance.hasErrors() && clinicalHistoryInstance.save()) {
			flash.message = "clinicalHistory.created"
			flash.args = [clinicalHistoryInstance.id]
			flash.defaultMessage = "Clinical History ${clinicalHistoryInstance.id} created"
			redirect(action: "list", id: params.patient)
		} else {
			render(view: "create", model: [clinicalHistoryInstance: clinicalHistoryInstance])
		}
	}
	
	def show = {
		def clinicalHistoryInstance = ClinicalHistory.get(params.id)
		if (!clinicalHistoryInstance) {
			flash.message = "clinicalHistory.not.found"
			flash.args = [params.id]
			flash.defaultMessage = "Clinical History not found with id ${params.id}"
			redirect(action: "list", model:[id: params.patient])
		} else {
			return [clinicalHistoryInstance: clinicalHistoryInstance]
		}
	}
	def edit = {
		def clinicalHistoryInstance = ClinicalHistory.get(params.id)
		if (!clinicalHistoryInstance) {
			flash.message = "clinicalHistory.not.found"
			flash.args = [params.id]
			flash.defaultMessage = "Clinical History not found with id ${params.id}"
			redirect(action: "list")
		} else {
			return [clinicalHistoryInstance: clinicalHistoryInstance]
		}
	}
	
	def update = {
		def clinicalHistoryInstance = ClinicalHistory.get(params.id)
		if (clinicalHistoryInstance) {
			def patient = Patient.get(params.patient)
			clinicalHistoryInstance.patient = patient
			if (params.version) {
				def version = params.version.toLong()
				if (clinicalHistoryInstance.version > version) {
					
					clinicalHistoryInstance.errors.rejectValue("version", "clientHistory.optimistic.locking.failure", "Another user has updated this Clinical History while you were editing")
					render(view: "edit", model: [clinicalHistoryInstance: clinicalHistoryInstance])
					return
				}
			}
			
			
			clinicalHistoryInstance.date = params.date
			clinicalHistoryInstance.title = params.title
			clinicalHistoryInstance.description = params.description.encodeAsHTML()
			
			if (!clinicalHistoryInstance.hasErrors() && clinicalHistoryInstance.save()) {
				flash.message = "clinicalHistory.updated"
				flash.args = [params.id]
				flash.defaultMessage = "Clinical History ${params.id} updated"
				redirect(action: "show", id: clinicalHistoryInstance.id)
			} else {
				render(view: "edit", model: [clinicalHistoryInstance: clinicalHistoryInstance])
			}
		} else {
			flash.message = "clinicalHistory.not.found"
			flash.args = [params.id]
			flash.defaultMessage = "Clinical History not found with id ${params.id}"
			redirect(action: "edit", id: params.id)
		}
	}
	
	def delete = {
		def clinicalHistoryInstance = ClinicalHistory.get(params.id)
		def id = clinicalHistoryInstance?.patient?.id
		if (clinicalHistoryInstance) {
			try {
				clinicalHistoryInstance.delete()
				flash.message = "clinicalHistory.deleted"
				flash.args = [params.id]
				flash.defaultMessage = "Clincal History ${params.id} deleted"
				redirect(action: "list", id: id)
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "clinicalHistory.not.deleted"
				flash.args = [params.id]
				flash.defaultMessage = "Clinical History ${params.id} could not be deleted"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "client.not.found"
			flash.args = [params.id]
			flash.defaultMessage = "Client not found with id ${params.id}"
			redirect(action: "list")
		}
	}
}
