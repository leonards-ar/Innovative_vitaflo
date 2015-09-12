package com.vitaflo.innova

import java.util.Date;

class ProductStock {

	Product product
	Date expiredDate
	String lot

	static hasMany = [purchaseDetails:PurchaseDetail, invoiceDetails:InvoiceDetail]	
	static constraints = {
		product(nullable:false)
		lot(nullable:true, unique:true)
		expiredDate(nullable: true)
	}

	static mapping = {
		table 'product_stock'
	}
	
	static transients = ['sold', 'bought']
	
	Integer getSold() {
		
		Integer total = 0;
		invoiceDetails.each{
			total += it.quantity
		}
		
		return total
		
	}
	
	Integer getBought() {

		Integer total = 0
		purchaseDetails.each{
			total += it.quantity
		}
		return total
		
	}


}
