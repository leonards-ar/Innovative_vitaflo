package com.vitaflo.innova

class Patient {
    static auditable = true

    String firstName
    String lastName
    String phone
    String contactName
    Country country
    Client client
    Date birth
	Double weight
    Double dose
    String doseUnit
    String deliveryAddress
    String physician
    String clinicalStatus
    String adverseEvent
    String status = 'Enabled'
    String initials
	
	//Transient properties
	String indicator

    static hasMany = [clinicalHistories: ClinicalHistory, pathologies: Pathology]
  
    static transients = ['indicator']
    static final def UNIT_LIST = ['sobres', 'sachets']

    static constraints = {
        firstName(blank:false, nullable:true)
        lastName(blank:false, nullable:true)
        country(blank:false)
        client(blank:false)
        dose(nullable:true, min:0.0d)
        doseUnit(nullable:true, inList:UNIT_LIST)
		weight(nullable:true, min:1.00d, max:1000.00d)
        birth(nullable:true)
        pathology(nullable:true)
        deliveryAddress(nullable:true)
        physician(nullable:true)
        clinicalStatus(nullable:true)
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
	
	def getDosePerWeight() {
		if(weight) return dose/weight
		
		return 0.00
	}
	
	//Returns true if the dosePerWeight is between the minDose and the MaxDose of the Pathology
	def isRegularDose() {
		if(!pathology || !pathology?.minDose || !pathology.maxDose) return true
		return (getDosePerWeight() >= pathology?.minDose && getDosePerWeight() <= pathology?.maxDose)
	}

   String toString(){
       if(!this.lastName && !this.firstName)
            return "${this.initials}"
        return "${this.lastName}, ${this.firstName}"
   }

   Pathology getPathology() {
	   def it = this.pathologies?.iterator();
	   return it?.hasNext() ? it?.next() : null
   }
}
