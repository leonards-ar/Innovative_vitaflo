package com.vitaflo.innova

class Supplier {
    static auditable = true
    
    String name
    String phone
    String email
    String contact

    // Time (in DAYS) it takes between the order is placed and the
    // product is delivered.
    //:TODO: Find a better way to set the default value!
    Integer deliveryPeriod = 15

    // Number of days that a supplier gives to innova to pay a purchase order
    Integer paymentConditionPeriod = PAYMENT_CONDITION_PERIOD

    static final def PAYMENT_CONDITION_PERIOD = 90

    static constraints = {
        name(blank:false)
        email(email:true)
        deliveryPeriod(min:1, nullable:false, blank:false)
        paymentConditionPeriod(min:1, nullable:false, blank:false)
    }

   static mapping = {
        table 'suppliers'
        phone column:'telephone'
    }

    String toString(){
        return name
    }
}
