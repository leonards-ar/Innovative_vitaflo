package com.vitaflo.innova

class Proforma {

    Date createdAt = new Date()

    Integer discount =0
    Double courier =200.0
    String status = 'Creada'

    Patient patient
    Client client

    static final def STATUS_LIST = ['Creada','Aprobada','Rechazada','Anulada']

    static hasMany = [details:ProformaDetail]

    static constraints = {
        patient(nullable:true)
        client(nullable:false)
        status(inList:STATUS_LIST)
        details(nullable:false,minSize:1)
    }

    static mapping = {
        table 'proformas'
        details cascade:'all, delete-orphan'
    }

    static transients = ['totalAmount', 'totalDetails', 'discountAmount']

    Double getTotalAmount(){

        Double totalAmount = this.courier        

        totalAmount += getTotalDetails()

        totalAmount -= getDiscountAmount()

        return totalAmount
    }

    Double getDiscountAmount() {
        return calculateDiscount(getTotalDetails())
    }

    Double getTotalDetails(){
        return this.details.sum{it.total}
    }

    Double calculateDiscount(Double amount){
        return amount * (this.discount/100d)
    }


    String toString(){
        return "${this.id} - ${this.client} - ${(this.patient)?this.patient:'---'}"
    }
}
