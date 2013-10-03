package com.vitaflo.innova

class Product {
    static auditable = true

    String name
    String description
    Double selPrice=0.0
	Double buyPrice=0.0
    Double presentation
    String doseUnit
    String comercialName
	String status='Enabled';
    
    Supplier supplier
    Drug drug

    static final def UNIT_LIST = ['sobres', 'sachets']

    static constraints = {
        name(blank:false)
        presentation(nullable:false, scale:4)
        supplier(nullable:false)
        drug(nullable:false)
        comercialName(nullable:true)
        doseUnit(nullable:true, inList:UNIT_LIST)
		status(inList:['Enabled','Disabled'])
    }

    static mapping = {
        table 'products'
		selPrice columne: 'sel_price'
		buyPrice column: 'buy_price'
    }

    static transients = ['deliveryPeriod']

    String toString() {
        return name
    }

    String shortName() {
      def words = name.split(" ")
      return "${words[0]} ${presentation}${(doseUnit != null)? doseUnit:""}"
    }

    Integer getDeliveryPeriod() {
        return supplier?.deliveryPeriod;
    }
}
