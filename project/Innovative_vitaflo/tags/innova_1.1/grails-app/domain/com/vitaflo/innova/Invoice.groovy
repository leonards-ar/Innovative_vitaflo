package com.vitaflo.innova

class Invoice implements Comparable {
    static auditable = true

    Date createdAt = new Date()
    Date date = new Date()
    Date deliveryDate
    String number
    String status = 'Pendiente'
    Double amount

    Purchase purchase
    
    static belongsTo = [proforma:Proforma]

    static final def STATUS_LIST = ['Pendiente','Pagada', 'Entregada']

    static constraints = {
        number(nullable:false, blank:false, unique:true)
        date(nullable:false)
        amount(nullable:false,min:0d)
        status(inList:STATUS_LIST, validator:{val, obj ->
            if ((val == 'Entregada') && !obj.deliveryDate){
                return "invoice.delivered.musthave.deliverydate.error"
           }
        })
        proforma(nullable:false, unique:true)
        purchase(nullable:true)
        deliveryDate(nullable:true, blank:true)
    }

    static transients = ['viewPurchase']

    static mapping = {
        table 'invoices'
        number column:'code'
    }

    String toString(){
        return this.number
    }

    //TODO: Resolve how to apply i18n without penalize performance.
    String getViewPurchase(){
        return "${this.number} - Proforma: ${this.proforma}"
    }

    int compareTo(other) {
        if(other instanceof Invoice) {
            if(number.isLong() && other.number.isLong()) {
                return number.compareTo(other.number);
            } else {
                // Just in case one of the values is not a valid number
                return number.compareTo(other.number);
            }
        } else {
            return -1;
        }
    }
}
