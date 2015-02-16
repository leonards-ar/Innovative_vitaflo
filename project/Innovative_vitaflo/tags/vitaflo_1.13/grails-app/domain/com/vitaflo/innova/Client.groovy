package com.vitaflo.innova

class Client {
    static auditable = true

    String name
    String address
    String phone
    String email
    String contact
    Country country
    String ivaResponsibleType
	String cuit
    String status = 'Enabled'

    static final def RESPIVA_LIST = ['inscripto','noinscripto','exento']
    static constraints = {
        name(blank:false)
        address(blank:false,nullable:true)
        phone(blank:false,nullable:true)
        email(email:true)
        country(blank: false)
		cuit(nullabel:true, length:15)
        ivaResponsibleType(nullable:true, inList:RESPIVA_LIST)
        status(nullable:false, blank:false, inList:['Enabled','Disabled','Deleted'])
    }

    static hasMany = [patients:Patient]

    static mapping = {
        table 'clients'
        phone column:'telephone'
        ivaResponsibleType column:'iva'
    }

    String toString(){
        return name
    }
}
