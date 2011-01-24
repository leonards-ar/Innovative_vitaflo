package com.vitaflo.innova

class Proforma {
	static auditable = true
	
	Date createdAt = new Date()
	Date deliveryDate
	
	Integer discount =0
	Double courier =200.0
	String status = 'Creada'
	Boolean donation = false
	Patient patient
	Client client
	String destinationAirport
	
	static final def STATUS_LIST = ['Creada','Aprobada','Rechazada','Anulada']
	
	static hasMany = [details:ProformaDetail]
	
	static constraints = {
		patient(nullable:true)
		client(nullable:false)
		status(inList:STATUS_LIST)
		details(nullable:false,minSize:1)
		destinationAirport(nullable:true)
		deliveryDate(nullable:true, blank:true)		
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
