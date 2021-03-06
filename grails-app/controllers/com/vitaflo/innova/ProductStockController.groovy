package com.vitaflo.innova
import grails.converters.JSON

class ProductStockController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {

		def products = Product.findAllByStatus('enabled');
		def stock = [];
		
		products.sort{it.name}
		products.each {p ->
			List productList = ProductStock.executeQuery("from ProductStock p where (p.expiredDate > ? or p.expiredDate is null) and p.product = ?", [Calendar.instance.getTime(), p])
			def sum = 0
			productList.each{
				sum += (it.bought - it.sold)
			}
			
			//def productStockList = ProductStock.executeQuery(select.toString(), [Calendar.instance.getTime()])
			def item = [product: p, sum:sum]
			stock.add(item);
		}
		
        return [productStockInstanceList: stock, productStockInstanceTotal: Product.count()]
    }

    def create = {
        def productStockInstance = new ProductStock()
        productStockInstance.properties = params
        return [productStockInstance: productStockInstance]
    }

    def save = {
        def productStockInstance = new ProductStock(params)
		
        if (!productStockInstance.hasErrors() && productStockInstance.save()) {
            flash.message = "productStock.created"
            flash.args = [productStockInstance.id]
            flash.defaultMessage = "ProductStock ${productStockInstance.id} created"
            redirect(action: "show", id: productStockInstance.id)
        }
        else {
            render(view: "create", model: [productStockInstance: productStockInstance])
        }
    }

    def show = {
 
		def product = Product.get(params.id.toLong())
		def productStockList = ProductStock.executeQuery("from ProductStock p where p.product = ? and (p.expiredDate > ? or p.expiredDate is null) order by p.expiredDate asc", [product, Calendar.instance.getTime()])
        
        if (!productStockList) {
            flash.message = "productStock.not.found"
            flash.args = [product]
            flash.defaultMessage = "There is no stock for product"
            redirect(action: "list")
        }
        else {
            return [productStockList: productStockList]
        }
    }

    def edit = {
        def productStockInstance = ProductStock.get(params.id)
        if (!productStockInstance) {
            flash.message = "productStock.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ProductStock not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [productStockInstance: productStockInstance]
        }
    }

    def update = {
        def productStockInstance = ProductStock.get(params.id)
        if (productStockInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (productStockInstance.version > version) {
                    
                    productStockInstance.errors.rejectValue("version", "productStock.optimistic.locking.failure", "Another user has updated this ProductStock while you were editing")
                    render(view: "edit", model: [productStockInstance: productStockInstance])
                    return
                }
            }
            productStockInstance.properties = params
            if (!productStockInstance.hasErrors() && productStockInstance.save()) {
                flash.message = "productStock.updated"
                flash.args = [params.id]
                flash.defaultMessage = "ProductStock ${params.id} updated"
                redirect(action: "show", id: productStockInstance.id)
            }
            else {
                render(view: "edit", model: [productStockInstance: productStockInstance])
            }
        }
        else {
            flash.message = "productStock.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ProductStock not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def productStockInstance = ProductStock.get(params.id)
        if (productStockInstance) {
            try {
                productStockInstance.delete()
                flash.message = "productStock.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "ProductStock ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "productStock.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "ProductStock ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "productStock.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ProductStock not found with id ${params.id}"
            redirect(action: "list")
        }
    }
	
	def updatePrice = {
		def product = Product.get(params.productId)
		def data = [price: product?.buyPrice]
		render data as JSON
	}
}
