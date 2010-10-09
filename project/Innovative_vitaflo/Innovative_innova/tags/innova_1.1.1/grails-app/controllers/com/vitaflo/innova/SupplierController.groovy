package com.vitaflo.innova

class SupplierController extends BaseController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        rememberListState([max: 15, offset: 0, sort: 'name', order: 'asc'])

        params.max = Math.min(params.max ? params.max.toInteger() : 15,  100)

        [supplierInstanceList: Supplier.list(params), supplierInstanceTotal: Supplier.count()]
    }

    def create = {
        def supplierInstance = new Supplier()
        supplierInstance.properties = params
        return [supplierInstance: supplierInstance]
    }

    def save = {
        def supplierInstance = new Supplier(params)
        if (!supplierInstance.hasErrors() && supplierInstance.save()) {
            flash.message = "supplier.created"
            flash.args = [supplierInstance.id]
            flash.defaultMessage = "Supplier ${supplierInstance.id} created"
            redirect(action: "show", id: supplierInstance.id)
        }
        else {
            render(view: "create", model: [supplierInstance: supplierInstance])
        }
    }

    def show = {
        def supplierInstance = Supplier.get(params.id)
        if (!supplierInstance) {
            flash.message = "supplier.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Supplier not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [supplierInstance: supplierInstance]
        }
    }

    def edit = {
        def supplierInstance = Supplier.get(params.id)
        if (!supplierInstance) {
            flash.message = "supplier.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Supplier not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [supplierInstance: supplierInstance]
        }
    }

    def update = {
        def supplierInstance = Supplier.get(params.id)
        if (supplierInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (supplierInstance.version > version) {
                    
                    supplierInstance.errors.rejectValue("version", "supplier.optimistic.locking.failure", "Another user has updated this Supplier while you were editing")
                    render(view: "edit", model: [supplierInstance: supplierInstance])
                    return
                }
            }
            supplierInstance.properties = params
            if (!supplierInstance.hasErrors() && supplierInstance.save()) {
                flash.message = "supplier.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Supplier ${params.id} updated"
                redirect(action: "show", id: supplierInstance.id)
            }
            else {
                render(view: "edit", model: [supplierInstance: supplierInstance])
            }
        }
        else {
            flash.message = "supplier.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Supplier not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def supplierInstance = Supplier.get(params.id)
        if (supplierInstance) {
            try {
                supplierInstance.delete()
                flash.message = "supplier.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Supplier ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "supplier.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Supplier ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "supplier.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Supplier not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def searchAutocomplete = {
        def suppliers = Supplier.findAllByNameLike('%' + params.supplier + '%')

        StringBuffer idList = new StringBuffer()
        idList.append('<ul>')

        suppliers?.each{s -> idList.append('<li>' + s.name + '</li>')}

        idList.append('</ul')

        render idList.toString()
  }

}
