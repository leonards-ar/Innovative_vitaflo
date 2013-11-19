package com.vitaflo.innova

class PathologyController extends BaseController{

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
		rememberListState([max: 15, offset: 0, sort: 'name', order: 'asc'])
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [pathologyInstanceList: Pathology.list(params), pathologyInstanceTotal: Pathology.count()]
    }

    def create = {
        def pathologyInstance = new Pathology()
        pathologyInstance.properties = params
        return [pathologyInstance: pathologyInstance]
    }

    def save = {
        def pathologyInstance = new Pathology(params)
        if (!pathologyInstance.hasErrors() && pathologyInstance.save()) {
            flash.message = "pathology.created"
            flash.args = [pathologyInstance.id]
            flash.defaultMessage = "Pathology ${pathologyInstance.id} created"
            redirect(action: "show", id: pathologyInstance.id)
        }
        else {
            render(view: "create", model: [pathologyInstance: pathologyInstance])
        }
    }

    def show = {
        def pathologyInstance = Pathology.get(params.id)
        if (!pathologyInstance) {
            flash.message = "pathology.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Pathology not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [pathologyInstance: pathologyInstance]
        }
    }

    def edit = {
        def pathologyInstance = Pathology.get(params.id)
        if (!pathologyInstance) {
            flash.message = "pathology.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Pathology not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [pathologyInstance: pathologyInstance]
        }
    }

    def update = {
        def pathologyInstance = Pathology.get(params.id)
        if (pathologyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pathologyInstance.version > version) {
                    
                    pathologyInstance.errors.rejectValue("version", "pathology.optimistic.locking.failure", "Another user has updated this Pathology while you were editing")
                    render(view: "edit", model: [pathologyInstance: pathologyInstance])
                    return
                }
            }
            pathologyInstance.properties = params
            if (!pathologyInstance.hasErrors() && pathologyInstance.save()) {
                flash.message = "pathology.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Pathology ${params.id} updated"
                redirect(action: "show", id: pathologyInstance.id)
            }
            else {
                render(view: "edit", model: [pathologyInstance: pathologyInstance])
            }
        }
        else {
            flash.message = "pathology.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Pathology not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def pathologyInstance = Pathology.get(params.id)
        if (pathologyInstance) {
            try {
                pathologyInstance.delete()
                flash.message = "pathology.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Pathology ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "pathology.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Pathology ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "pathology.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Pathology not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
