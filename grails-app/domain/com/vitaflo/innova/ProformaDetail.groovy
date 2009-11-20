package com.vitaflo.innova

class ProformaDetail {

    Integer quantity = 0
    String lot
    Double dailyDose
    String doseUnit
    Product product
    Double price

    static belongsTo = [proforma: Proforma]

    static final def UNIT_LIST = ['mg', 'ml']

    static constraints = {
        quantity(nullable:false, min:1)
        product(nullable:false)
        lot(nullable:true)
        dailyDose(nullable:true)
        doseUnit(nullable:true, inList:UNIT_LIST)
        price(nullable:false, min:0d)
    }



    static mapping = {
        table 'proformadetails'
        price column:'price_each'
    }

    static transients = ['total','productName','productPrice', 'totalDoseDays']

    Integer getTotalDoseDays() {
        if(this.product?.presentation != null && this.dailyDose != null && this.quantity != null) {
            return new Integer(this.product?.presentation * this.quantity / this.dailyDose)
        } else {
            return new Integer(0);
        }

    }

    Double getTotal(){
        this.price * this.quantity
    }

    String getProductName(){
        this.product.name;
    }

    String toString() {
        return "${this.proforma} - ${this.product}"
    }

}
