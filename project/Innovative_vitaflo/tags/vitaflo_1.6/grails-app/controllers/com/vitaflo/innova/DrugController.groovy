package com.vitaflo.innova

class DrugController extends BaseController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        rememberListState([max: 15, offset: 0, sort: 'name', order: 'asc'])

        params.max = Math.min(params.max ? params.max.toInteger() : 15,  100)
        
        [drugInstanceList: Drug.list(params), drugInstanceTotal: Drug.count()]
    }

    def create = {
        def drugInstance = new Drug()
        drugInstance.properties = params
        return [drugInstance: drugInstance]
    }

    def save = {
        def drugInstance = new Drug(params)
        if (!drugInstance.hasErrors() && drugInstance.save()) {
            flash.message = "drug.created"
            flash.args = [drugInstance.id]
            flash.defaultMessage = "Drug ${drugInstance.id} created"
            redirect(action: "show", id: drugInstance.id)
        }
        else {
            render(view: "create", model: [drugInstance: drugInstance])
        }
    }

    def show = {
        def drugInstance = Drug.get(params.id)
        if (!drugInstance) {
            flash.message = "drug.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Drug not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [drugInstance: drugInstance]
        }
    }

    def edit = {
        def drugInstance = Drug.get(params.id)
        if (!drugInstance) {
            flash.message = "drug.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Drug not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [drugInstance: drugInstance]
        }
    }

    def update = {
        def drugInstance = Drug.get(params.id)
        if (drugInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (drugInstance.version > version) {
                    
                    drugInstance.errors.rejectValue("version", "drug.optimistic.locking.failure", "Another user has updated this Drug while you were editing")
                    render(view: "edit", model: [drugInstance: drugInstance])
                    return
                }
            }
            drugInstance.properties = params
            if (!drugInstance.hasErrors() && drugInstance.save()) {
                flash.message = "drug.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Drug ${params.id} updated"
                redirect(action: "show", id: drugInstance.id)
            }
            else {
                render(view: "edit", model: [drugInstance: drugInstance])
            }
        }
        else {
            flash.message = "drug.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Drug not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def drugInstance = Drug.get(params.id)
        if (drugInstance) {
            try {
                drugInstance.delete()
                flash.message = "drug.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Drug ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "drug.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Drug ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "drug.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Drug not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
