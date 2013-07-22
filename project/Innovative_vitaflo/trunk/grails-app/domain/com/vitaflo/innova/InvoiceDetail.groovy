package com.vitaflo.innova

class InvoiceDetail {
    
    Integer quantity = 0
    Double price;
	Double dailyDose
	String doseUnit
     
    static belongsTo = [invoice:Invoice, productStock:ProductStock]

  
    static constraints = {
        quantity(nullable:false, min:1)
        price(nullable:false, min:0d)
		quantity validator: {
			var total = productStock?.getSold() + it
			return ( total <= productStock?.getBought())
		}
    }
    
    static mapping = {
        table 'invoicedetails'
        price column:'price_each'
    }
    
	static transients = ['total','productName','productPrice','totalDoseDays','dailyDose','doseUnit','lot']
	
	Integer getTotalDoseDays() {
		if(this.product?.presentation != null && this.dailyDose != null && this.quantity != null) {
			return Math.ceil(this.product?.presentation * this.quantity / this.dailyDose);
		} else {
			return new Integer(0);
		}

	}

	Double getTotal(){
		this.price * this.quantity
	}

	String getProductName(){
		this.productStock.product.name;
	}
	
	String getLot(){
		this.productStock.lot
	}

	String toString() {
		return "${this.invoice} - ${this.productStock.product}"
	}



}
