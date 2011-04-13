package com.vitaflo.innova

class PurchaseDetail {

    Integer quantity = 0
    String lot
    Product product
    Double price

    static belongsTo = [purchase: Purchase]

    static final def UNIT_LIST = ['sobres', 'sachets']

    static constraints = {
        quantity(nullable:false, min:1)
        product(nullable:false)
        lot(nullable:true)
        price(nullable:false, min:0d)
    }



    static mapping = {
        table 'purchasedetails'
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
