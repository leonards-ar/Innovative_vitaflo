package com.vitaflo.innova

import org.grails.plugins.springsecurity.service.AuthenticateService

class PatientController extends BaseController {

    def authenticateService
    
    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        rememberListState([max: 15, offset: 0, sort: 'lastName', order: 'asc'])

        def query = {
            ne('status', 'Deleted')

            if(params.patient) {
                or{
                    like('lastName', '%' + params.patient + '%')
                    like('firstName', '%' + params.patient + '%')
                    like('initials', '%' + params.patient + '%')
                }
            }

            if(params.selectedCountry){
                country{
                    eq('code', params.selectedCountry)
                }
            } else {
                inList('country', session.countries)
            }

            if(params.client) {
                client{
                    like('name', '%' + params.client + '%')
                }
            }

            if(params.pathology) {
                eq('pathology', params.pathology)
            }
        }

        def criteria = Patient.createCriteria()

        def total = criteria.count(query)

        def patients = Patient.withCriteria {
            maxResults(params.max?.toInteger())
            firstResult(params.offset?.toInteger())
            ne('status', 'Deleted')

            if (params.sort == 'clientName') {
                client { order('name', params.order) }
            } else{
                order(params.sort, params.order)
            }

            if(params.patient) {
                or{
                    like('lastName', '%' + params.patient + '%')
                    like('firstName', '%' + params.patient+ '%')
                    like('initials', '%' + params.patient + '%')
                }
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
                eq('pathology', params.pathology)
            }
        }

        [patientInstanceList: patients, patientInstanceTotal: total, client: params.client, patient:params.patient, selectedCountry: params.selectedCountry, pathology: params.pathology]
    }

    private getClientsForSelectList(country) {
         Client.withCriteria {
            ne('status', 'Deleted')
            eq('country',country)
            order("name", "asc")
        }
    }

    def create = {
        def patientInstance = new Patient()
        patientInstance.properties = params

        def clientList = getClientsForSelectList(session.countries[0])
        return [patientInstance: patientInstance, clientList: clientList]
    }

    def save = {
        def patientInstance = new Patient(params)
        if (!patientInstance.hasErrors() && patientInstance.save()) {
            flash.message = "patient.created"
            flash.args = [patientInstance.id]
            flash.defaultMessage = "Patient ${patientInstance.id} created"
            redirect(action: "show", id: patientInstance.id)
        }
        else {
            def clientList = getClientsForSelectList(patientInstance.country)
            render(view: "create", model: [patientInstance: patientInstance, clientList: clientList])
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
            return [patientInstance: patientInstance]
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
            return [patientInstance: patientInstance, clientList: clientList]
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
            if (!patientInstance.hasErrors() && patientInstance.save()) {
                flash.message = "patient.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Patient ${params.id} updated"
                redirect(action: "show", id: patientInstance.id)
            }
            else {
                def clientList = getClientsForSelectList(patientInstance.country)
                render(view: "edit", model: [patientInstance: patientInstance, clientList: clientList])
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

        patients?.each{p -> idList.append('<li>' + p + '</li>')}

        idList.append('</ul>')

        render idList.toString()
    }

    def searchAutocompletePathology = {
        def pathologies = Patient.executeQuery("select distinct p.pathology from Patient p where p.pathology like ?", ["%" + params.pathology + "%"])

        StringBuffer idList = new StringBuffer()
        idList.append('<ul>')

        pathologies?.each{p -> idList.append('<li>' + p + '</li>')}

        idList.append('</ul>')

        render idList.toString()
    }

}
