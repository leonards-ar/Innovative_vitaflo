package com.vitaflo.innova

class PatientProductStock {

    Patient patient
    Product product
    // Date the patient will start taking products from these proforma.
    Date startDate
    Date runningOutOfStockDate
    Proforma proforma
    // Stock per product and patient is a simple linked list.
    PatientProductStock next = null

    Boolean notified
    
    static constraints = {
        patient(nullable:false)
        product(nullable:false)
        startDate(nullable:false)
        runningOutOfStockDate(nullable:false)
        next(nullable:true)
    }

    def totalDays() {
        return runningOutOfStockDate - startDate
    }

    String toString(){
        return "${this.id} - ${this.patient} - ${this.product} - ${this.startDate} - ${this.runningOutOfStockDate} - ${this.notified}"
    }
}
