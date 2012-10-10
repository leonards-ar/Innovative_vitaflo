package com.vitaflo.innova

class Proforma {
	static auditable = true
	
	Date createdAt = new Date()
	Date deliveryDate
	
	Integer discount=0
	Double courier=0.0
	String status = 'Creada'
	Boolean donation = false
	Patient patient
	Client client
	String destinationAirport
	Integer paymentConditions = 20
	Double dollarValue=0.0
	
	static final def STATUS_LIST = ['Creada','Aprobada','Rechazada','Anulada']
	
	static hasMany = [details:ProformaDetail]
	
	static constraints = {
		patient(nullable:true)
		client(nullable:false)
		status(inList:STATUS_LIST)
		details(nullable:false,minSize:1)
		destinationAirport(nullable:true)
		deliveryDate(nullable:true, blank:true)	
		dollarValue(nullable:true, blank:true)
		paymentConditions(nullable:false, blank:false, default:20)
	}
	
	static mapping = {
		table 'proformas'
		details cascade:'all, delete-orphan'
	}
	
	static transients = ['totalAmount', 'totalDetails', 'discountAmount']
	
	Double getTotalAmount() {
		
		Double totalAmount = this.courier
		
		totalAmount += getTotalDetails()
		
		totalAmount -= getDiscountAmount()
		
		return totalAmount
	}
	
	Double getDiscountAmount() {
		return calculateDiscount(getTotalDetails())
	}
	
	Double getTotalDetails(){
		return (this.details)?this.details.sum{it.total}:0.0
	}
	
	Double calculateDiscount(Double amount){
		return amount * (this.discount/100d)
	}
	
	def products(){
		details.collect{[product:it.product,quantity:it.quantity]}
	}
	
	String toString(){
		return "${this.id} - ${this.client} - ${(this.patient)?this.patient:'---'}"
	}
}
