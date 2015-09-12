package com.vitaflo.innova

class InvoiceDetail {
    
    Integer quantity = 0
    Double price;
     
    static belongsTo = [invoice:Invoice, productStock:ProductStock]

  
    static constraints = {
        quantity(nullable:false, min:1)
        price(nullable:false, min:0d)
		quantity validator: {val, obj ->
			Integer sold = obj?.productStock?.sold
			Integer bought = obj?.productStock?.bought
			def total = obj.id?  sold : sold + val
			if(!(total <= bought)) return ['invoiceDetail.quantity.validator.error',obj?.getProductName(),obj?.getLot(),(total - bought)]
		}
    }
    
    static mapping = {
        table 'invoicedetails'
        price column:'price_each'
    }
    
	static transients = ['total','productName','lot','product','totalDoseDays']
	
	Double getTotal(){
		this.price * this.quantity
	}

	String getProductName(){
		this.productStock.product.name;
	}
	
	Product getProduct(){
		this.productStock.product
	}
	
	Integer getTotalDoseDays(Double dailyDose) {
		if(this.product?.presentation != null && dailyDose != null && this.quantity != null) {
			return Math.ceil(this.product?.presentation * this.quantity / dailyDose);
		} else {
			return new Integer(0);
		}

	}
	
	String getLot(){
		this.productStock.lot
	}

	String toString() {
		return "${this.invoice} - ${this.productStock.product}"
	}



}
