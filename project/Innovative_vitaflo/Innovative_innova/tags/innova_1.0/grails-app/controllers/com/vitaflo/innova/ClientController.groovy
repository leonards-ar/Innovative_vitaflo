package com.vitaflo.innova

import grails.converters.JSON

class ClientController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 15, 100)
    
        if (!params.offset) params.offset = 0
        if (!params.sort) params.sort = "name"
        if (!params.order) params.order = "asc"

        def query = {
            ne('status', 'Deleted')

            if (params.clientName) {
                like('name', '%' + params.clientName + '%')
            }
      
            if (params.selectedCountry) {
                country {
                    eq('code', params.selectedCountry)
                }
            } else {
                inList('country', session.countries)
            }
        }

        def criteria = Client.createCriteria();

        def total = criteria.count(query);

        def clients = Client.withCriteria {
            maxResults(params.max)
            firstResult(params.offset?.toInteger())
            order(params.sort, params.order)
            ne('status', 'Deleted')

            if (params.clientName) {
                like('name', '%' + params.clientName + '%')
            }
            if (params.selectedCountry) {
                country {
                    eq('code', params.selectedCountry)
                }
            } else {
                inList('country', session.countries)
            }

        }

        [clientInstanceList: clients, clientInstanceTotal: total, clientName: params.clientName]
    }

    def create = {
        def clientInstance = new Client()
        clientInstance.properties = params
        return [clientInstance: clientInstance]
    }

    def save = {
        def clientInstance = new Client(params)
        if (!clientInstance.hasErrors() && clientInstance.save()) {
            flash.message = "client.created"
            flash.args = [clientInstance.id]
            flash.defaultMessage = "Client ${clientInstance.id} created"
            redirect(action: "show", id: clientInstance.id)
        }
        else {
            render(view: "create", model: [clientInstance: clientInstance])
        }
    }

    def show = {
        def clientInstance = Client.get(params.id)
        if (!clientInstance) {
            flash.message = "client.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Client not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [clientInstance: clientInstance]
        }
    }

    def edit = {
        def clientInstance = Client.get(params.id)
        if (!clientInstance) {
            flash.message = "client.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Client not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [clientInstance: clientInstance]
        }
    }

    def update = {
        def clientInstance = Client.get(params.id)
        if (clientInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (clientInstance.version > version) {

                    clientInstance.errors.rejectValue("version", "client.optimistic.locking.failure", "Another user has updated this Client while you were editing")
                    render(view: "edit", model: [clientInstance: clientInstance])
                    return
                }
            }
            clientInstance.properties = params
            if (!clientInstance.hasErrors() && clientInstance.save()) {
                flash.message = "client.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Client ${params.id} updated"
                redirect(action: "show", id: clientInstance.id)
            }
            else {
                render(view: "edit", model: [clientInstance: clientInstance])
            }
        }
        else {
            flash.message = "client.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Client not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def clientInstance = Client.get(params.id)
        if (clientInstance) {
            try {
                //clientInstance.delete()
                clientInstance.status = 'Deleted'
                if(!clientInstance.hasErrors() && clientInstance.save()) {
                    flash.message = "client.deleted"
                    flash.args = [params.id]
                    flash.defaultMessage = "Client ${params.id} deleted"
                    redirect(action: "list")
                } else {
                    flash.message = "client.not.deleted"
                    flash.args = [params.id]
                    flash.defaultMessage = "Client ${params.id} could not be deleted"
                    redirect(action: "show", id: params.id)
                }
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "client.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Client ${params.id} could not be deleted"
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

    def searchAjax = {
        
        if (!params.sort) params.sort = "name"
        if (!params.order) params.order = "asc"

        def clients = Client.withCriteria{
            ne('status', 'Deleted')
            like('name', '%' + params.name + '%')
            inList('country', session.countries)
        }

        render clients as JSON
    }

    def searchClientsByCountry = {
        
        def clients = Client.withCriteria {
            ne('status', 'Deleted')
            eq('country',Country.get(params.country))
            order("name", "asc")
        }

        render clients as JSON
    }

    def searchAutocomplete = {
        def clients = Client.withCriteria{
            like('name', '%' + params.client + '%')
            inList('country', session.countries)
        }

        StringBuffer idList = new StringBuffer()
        idList.append('<ul>')

        clients?.each{c -> idList.append('<li>' + c.name + '</li>')}

        idList.append('</ul')

        render idList.toString()
    }



}
