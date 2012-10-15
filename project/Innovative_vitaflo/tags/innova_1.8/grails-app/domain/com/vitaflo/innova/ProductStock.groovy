package com.vitaflo.innova

import java.util.Date;

class ProductStock {

	Integer quantity = 0
	Product product
	Double price
	Integer sold = 0
	Date expiredDate
	String lot
	
	static belongsTo = [purchase: Purchase]

	static final def UNIT_LIST = ['sobres', 'sachets']

	static constraints = {
		quantity(nullable:false, min:1)
		product(nullable:false)
		price(nullable:false, min:0d)
		lot(nullable:true)
		expiredDate(nullable: true)
	}



	static mapping = {
		table 'product_stock'
		price column:'price_each'
	}

	static transients = ['total','productName','productPrice', 'totalDoseDays']


	Double getTotal(){
		this.price * this.quantity
	}

	String getProductName(){
		this.product.name;
	}

	String toString() {
		return "${this.purchase} - ${this.product}"
	}

}
