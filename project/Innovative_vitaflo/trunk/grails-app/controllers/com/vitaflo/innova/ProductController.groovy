package com.vitaflo.innova

class ProductController extends BaseController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        rememberListState([max: 15, offset: 0, sort: 'name', order: 'asc'])

        def query = {
            if(params.name) {
                like('name', '%' + params.name + '%')
            }
            if(params.supplier) {
                supplier {
                    eq('name', params.supplier)
                }
            }

        }

        def criteria = Product.createCriteria()
        def total = criteria.count(query)

        def products = Product.withCriteria {

            maxResults(params.max?.toInteger())
            firstResult(params.offset?.toInteger())
            order(params.sort, params.order)

            if(params.name) {
                like('name', '%' + params.name + '%')
            }
            if(params.supplier) {
                supplier {
                    eq('name', params.supplier)
                }
            }

        }

        [productInstanceList: products, productInstanceTotal: total, name:params.name, supplier: params.supplier]
    }

    def create = {
        def productInstance = new Product()
        productInstance.properties = params
        return [productInstance: productInstance]
    }

    def save = {
        def productInstance = new Product(params)
        if (!productInstance.hasErrors() && productInstance.save()) {
            flash.message = "product.created"
            flash.args = [productInstance.id]
            flash.defaultMessage = "Product ${productInstance.id} created"
            redirect(action: "show", id: productInstance.id)
        }
        else {
            render(view: "create", model: [productInstance: productInstance])
        }
    }

    def show = {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
            flash.message = "product.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Product not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [productInstance: productInstance]
        }
    }

    def edit = {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
            flash.message = "product.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Product not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [productInstance: productInstance]
        }
    }

    def update = {
        def productInstance = Product.get(params.id)
        if (productInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (productInstance.version > version) {
                    
                    productInstance.errors.rejectValue("version", "product.optimistic.locking.failure", "Another user has updated this Product while you were editing")
                    render(view: "edit", model: [productInstance: productInstance])
                    return
                }
            }
            productInstance.properties = params
            if (!productInstance.hasErrors() && productInstance.save()) {
                flash.message = "product.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Product ${params.id} updated"
                redirect(action: "show", id: productInstance.id)
            }
            else {
                render(view: "edit", model: [productInstance: productInstance])
            }
        }
        else {
            flash.message = "product.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Product not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def productInstance = Product.get(params.id)
        if (productInstance) {
            try {
                productInstance.delete()
                flash.message = "product.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Product ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "product.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Product ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "product.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Product not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
