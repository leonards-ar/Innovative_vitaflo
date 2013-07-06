package com.vitaflo.innova

class PurchaseDetail {
	
	Integer quantity = 0
	Double price

	static belongsTo = [purchase:Purchase, productStock:ProductStock]
	static mapping = {
		table 'purchasedetails'
		price column:'price_each'
	}
	
	static transients = ['product','lot','expiredDate','total']
	
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
