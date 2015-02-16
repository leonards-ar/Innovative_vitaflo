package com.vitaflo.innova

class PurchaseDetail {
	
	Integer quantity = 0
	Double price

	static belongsTo = [purchase:Purchase, productStock:ProductStock]
	
	static constraints = {
		quantity(nullable:false, min:1)
		price(nullable:false, min:0d)
	}
	
	static mapping = {
		table 'purchasedetails'
		price column:'price_each'
		productStock cascade:'all-delete-orphan'
	}
	
	static transients = ['product','lot','expiredDate','total','productName']
	
	Product getProduct(){
		return productStock?.product
	}
	
	String getLot(){
		return productStock?.lot
	}
	
	Date getExpiredDate(){
		return productStock?.expiredDate
	}
	
	Double getTotal(){
		this.price * this.quantity
	}
	
	String getProductName(){
		return productStock?.product?.name
	}
	
}
