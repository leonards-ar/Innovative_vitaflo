package com.vitaflo.innova

class InvoiceDetail {
    
    Integer quantity = 0
    Double price;
     
    static belongsTo = [invoice:Invoice, productStock:ProductStock]
    
    static constraints = {
        quantity(nullable:false, min:1)
        price(nullable:false, min:0d)
    }
    
    static mapping = {
        table 'invoicedetails'
        price column:'price_each'
    }
    



}
