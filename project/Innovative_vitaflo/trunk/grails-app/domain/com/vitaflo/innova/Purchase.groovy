package com.vitaflo.innova

class Purchase implements Comparable {

    String codeNumber
    Double amount
    Date creationDate = new Date()
    Date expireDate
    String status = 'Pending'

    Supplier supplier

    static hasMany = [invoices:Invoice]

    static final def STATUS_LIST = ['Paid','Pending','Free']

    static constraints = {
        codeNumber(nullable:false, blank:false, unique:true)
        creationDate(nullable:false)
        expireDate(nullable:false, validator:{val, obj ->
            if (val.before(obj.creationDate)){
                return "purchase.expireDate.less.creationDate"
           }
        })
        amount(nullable:false,min:0.01d)
        status(inList:STATUS_LIST)
        supplier(nullable:false, blank:false)
        invoices(nullable:false,minSize:1)
    }

    static mapping = {
        table 'purchases'
        codeNumber column:'code'
        creationDate column:'date'
        invoices cascade: 'save-update'
    }

    String toString(){
        return this.codeNumber;
    }

    int compareTo(other) {
        if(other instanceof Purchase) {
            if(codeNumber.isLong() && other.codeNumber.isLong()) {
                return codeNumber.compareTo(other.codeNumber);
            } else {
                // Just in case one of the values is not a valid number
                return codeNumber.compareTo(other.codeNumber);
            }
        } else {
            return -1;
        }
    }
}
