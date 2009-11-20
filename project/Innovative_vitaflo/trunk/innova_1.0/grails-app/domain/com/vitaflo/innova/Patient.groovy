package com.vitaflo.innova

class Patient {

    String firstName
    String lastName
    String phone
    String contactName
    Country country
    Client client
    Date birth
    Double dose
    String doseUnit
    String pathology
    String deliveryAddress
    String physician
    String clinicalStatus
    String clinicalHistory
    String adverseEvent
    String status = 'Enabled'
    String initials
    
    //Transient properties
    Date startNTBC
    Product product
    Date lastOrderedDate
    Float orderedQuantity
    String reimbursement

    static transients = ['startNTBC', 'product', 'lastOrderedDate', 'orderedQuantity', 'reimbursement']

    static final def UNIT_LIST = ['mg', 'ml']

    static constraints = {
        firstName(blank:false, nullable:true)
        lastName(blank:false, nullable:true)
        country(blank:false)
        client(blank:false)
        dose(nullable:true, min:0.0d)
        doseUnit(nullable:true, inList:UNIT_LIST)
        birth(nullable:true)
        pathology(nullable:true)
        deliveryAddress(nullable:true)
        physician(nullable:true)
        clinicalStatus(nullable:true)
        clinicalHistory(nullable:true)
        adverseEvent(nullable:true)
        status(nullable:false, blank:false, inList:['Enabled','Disabled','Deleted'])
        initials(blank:false)
    }

    static mapping = {
        table 'patients'
        phone column:'telephone'
        firstName column:'first_name'
        lastName column:'last_name'
        phone column:'telephone'
        contactName column:'contact'
        deliveryAddress column:'delivery_address'
    }

   String toString(){return "${this.lastName}, ${this.firstName}"}
}
