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
	// New per Dr. Mariano Albertal request (INNOVA#93)
	boolean adverseEventReported = false
	String email
	String cellphone
	String motherCellphone
	String fatherCellphone
	String observations
	boolean similarProblemsInFamily = false
	String similarProblemsInFamilyDescription
	
	//Transient properties
	String indicator

    static hasMany = [clinicalHistories: ClinicalHistory, pathologies: Pathology]
  
    static transients = ['indicator', 'pathology', 'ageMonths', 'ageYears']
    static final def UNIT_LIST = ['sobres', 'sachets','gr','latas','ml']

    static constraints = {
        firstName(blank:false, nullable:true)
        lastName(blank:false, nullable:true)
        country(blank:false)
        client(blank:false)
        dose(nullable:true, min:0.0d)
        doseUnit(nullable:true, inList:UNIT_LIST)
		weight(nullable:true, min:1.00d, max:1000.00d)
        birth(nullable:true)
        deliveryAddress(nullable:true)
        physician(nullable:true)
        clinicalStatus(nullable:true)
        adverseEvent(nullable:true)
        status(nullable:false, blank:false, inList:['Enabled','Disabled','Deleted'])
        initials(blank:false)
		email(nullable:true)
		cellphone(nullable:true)
		motherCellphone(nullable:true)
		fatherCellphone(nullable:true)
		observations(nullable:true)
		similarProblemsInFamilyDescription(nullable:true)
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
		if(weight && dose) return dose/weight
		
		return 0.0
	}
	
	//Returns true if the dosePerWeight is between the minDose and the MaxDose of the Pathology
	def isRegularDose() {
		if(!this.getPathology()) return true		
		return (getDosePerWeight() >= getPathology()?.minDose && getDosePerWeight() <= getPathology()?.maxDose)	}

   String toString(){
       if(!this.lastName && !this.firstName)
            return "${this.initials}"
        return "${this.lastName}, ${this.firstName}"
   }

   Pathology getPathology() {
	   def it = this.pathologies?.iterator();
	   return it?.hasNext() ? it?.next() : null
   }
   
   def monthsBetween(from, to){
	   def monthBetween = (to[Calendar.MONTH] - from[Calendar.MONTH])
	   def yearsBetween = to[Calendar.YEAR] - from[Calendar.YEAR]
	   monthBetween + (yearsBetween * 12)
   }
   
   String getAgeYears() {
	   if(birth != null) {
		   def months = monthsBetween(birth, new Date())
		   def years = (int) (months / 12)
		   return "${years}"
	   }
   }
   
   String getAgeMonths() {
	   if(birth != null) {
		   def months = monthsBetween(birth, new Date()) % 12
		   return "${months}"
	   }
   }
}
