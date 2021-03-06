package com.vitaflo.innova.service

import com.vitaflo.innova.Invoice
import com.vitaflo.innova.Product
import com.vitaflo.innova.Patient
import com.vitaflo.innova.Proforma
import com.vitaflo.innova.ProformaDetail
import com.vitaflo.innova.PatientProductStock
import com.vitaflo.innova.User

class PatientProductStockService {
	def mailService
	def grailsApplication
	
	boolean transactional = true
	
	def updatePatientProductStock(Invoice invoice) {
		if(invoice.deliveryDate != null) {
			Proforma proforma = invoice.getProforma();
			
			invoice?.soldProducts.each { invoiceDetail ->
				def patientProductStock = getPatientProductStock(proforma.patient, invoiceDetail.product, proforma);
				def endDate, startDate
				
				ProformaDetail proformaDetail = proforma.getDetails().find{it.product == invoiceDetail.product}

				Double dailyDose = proformaDetail?.dailyDose
				if(patientProductStock != null) {
					// It is an update of this invoice
					if(invoice.deliveryDate > patientProductStock.startDate) {
						startDate = clearTime(invoice.deliveryDate)
						endDate = startDate + invoiceDetail.getTotalDoseDays(dailyDose)
						patientProductStock.startDate = startDate
						patientProductStock.runningOutOfStockDate = endDate
						patientProductStock.notified = false;
						
						if(!patientProductStock.save()) {
							patientProductStock.errors.each { log.error invoiceDetail }
						} else {
							updateNextPatientProductStock(patientProductStock)
						}
					}
				} else {
					// New record
					patientProductStock = new PatientProductStock();
					patientProductStock.patient = proforma.patient;
					patientProductStock.product = invoiceDetail.product;
					patientProductStock.proforma = proforma;
					patientProductStock.startDate = invoice.deliveryDate;
					
					def prevPatientProductStock = getPreviousPatientProductStock(patientProductStock);
					
					if(prevPatientProductStock != null) {
						patientProductStock.next = prevPatientProductStock.next;
						if(prevPatientProductStock.runningOutOfStockDate > patientProductStock.startDate) {
							patientProductStock.startDate = prevPatientProductStock.runningOutOfStockDate + 1
						}
						prevPatientProductStock.next = patientProductStock;
						if(!prevPatientProductStock.save()) {
							prevPatientProductStock.errors.each { log.error invoiceDetail }
						}
					}
					
					
					
					patientProductStock.runningOutOfStockDate = patientProductStock.startDate + invoiceDetail.getTotalDoseDays(dailyDose);
					patientProductStock.notified = false;
					
					if(!patientProductStock.save()) {
						patientProductStock.errors.each { log.error invoiceDetail }
					} else {
						updateNextPatientProductStock(patientProductStock)
					}
				}
			}
		}
	}
	
	def getLastPatientProductStock(Patient patient) {
		def result = PatientProductStock.withCriteria {
			patient {
				eq("id", patientProductStock.patient.id)
			}
			lt("runningOutOfStockDate", patientProductStock.startDate)
			maxResults(1)
			order("runningOutOfStockDate", "desc")
		}
		
		if(result != null && result.size() > 0) {
			return result.get(0);
		}
		
		return null;
	}
	private getPatientProductStock(Patient patient, Product product, Proforma proforma) {
		def result = PatientProductStock.findAllWhere(product:product, patient:patient, proforma:proforma);
		if(result != null && result.size() > 0) {
			return result.get(0);
		} else {
			return null;
		}
	}
	
	private getPreviousPatientProductStock(PatientProductStock patientProductStock) {
		def result = PatientProductStock.withCriteria {
			product {
				eq("id", patientProductStock.product.id)
			}
			patient {
				eq("id", patientProductStock.patient.id)
			}
			lt("runningOutOfStockDate", patientProductStock.startDate)
			maxResults(1)
			order("runningOutOfStockDate", "desc")
		}
		
		if(result != null && result.size() > 0) {
			return result.get(0);
		} else {
			return null;
		}
	}
	
	private updateNextPatientProductStock(PatientProductStock start) {
		def endDate = start.runningOutOfStockDate
		def startDate
		def current = start
		
		while(current.next != null) {
			startDate = endDate + 1
			endDate = startDate + current.next.totalDays();
			
			if(current.runningOutOfStockDate > current.next.startDate) {
				current = current.next
				current.startDate = startDate
				current.runningOutOfStockDate = endDate
				current.notified = false
				
				if(!current.save()) {
					current.errors.each { log.error it }
				}
			} else {
				current = current.next
			}
		}
	}
	
	def sendPatientsProductStockNotifications() {
		log.debug "Executing sendPatientsProductStockNotifications..."
		listPatientsProductStockToNotify().each { patientProductStock ->
			if(sendNotification(patientProductStock)) {
				patientProductStock.setNotified(true);
				if(!patientProductStock.save(flush:true)) {
					patientProductStock.errors.each { err -> log.error err }
				}
			}
		}
	}
	
	def listPatientsProductStockToNotify() {
		def patientProductStocksToNotify = []
		def today = clearTime(new Date())
		
		getCandidateProductsToNotify().each {
			def deliveryPeriod = it?.deliveryPeriod != null ? it.deliveryPeriod : 0;
			def productId = it?.id;
			
			patientProductStocksToNotify.addAll(
					PatientProductStock.withCriteria {
						if(productId != null) {
							product { eq("id", productId) }
						}
						isNull("next") // Is the last item of the linked list!
						eq("notified", false)
						or {
							eq("runningOutOfStockDate", today + deliveryPeriod)
							lt("runningOutOfStockDate", today + deliveryPeriod)
						}
					}
					)
		}
		return patientProductStocksToNotify;
	}
	
	def getLastOrderedProductsByPatient(Long patientId) {
		
		def products = PatientProductStock.withCriteria {
			projections{
				groupProperty("product")
				max("startDate")
			}
			
			patient { eq("id", patientId) }
			isNull("next") // Is the last item of the linked list!
			
		}
		
		def lastOrderdedProduct = []
		
		products.each {it->
			lastOrderdedProduct.addAll(
					PatientProductStock.withCriteria {
						patient { eq("id", patientId) }
						eq("product", it[0])
						eq("startDate", it[1])
						isNull("next") // Is the last item of the linked list!
					}
			)
		}
		
		return lastOrderdedProduct
	}
	
	private clearTime(Date dt) {
		def strDate = dt.format("yyyy-MM-dd");
		return new Date().parse("yyyy-MM-dd", strDate);
	}
	
	private sendNotification(PatientProductStock patientProductStock) {
		def recipients = getRecipientsToNotify(patientProductStock).toArray();
		
		if(recipients != null && recipients.length > 0) {
			try{
				mailService.sendMail {
					from grailsApplication.config.application.emailFromAddress
					to recipients
					subject "${patientProductStock.patient} - ${patientProductStock.product}"
					body (view:"/emails/runningoutofstocknotification", model:[patientProductStockInstance:patientProductStock])
				}
				return true;
			} catch(Exception e) {
				log.error "Problem sending email $e.message", e
				return false;
			}
		} else {
			log.warn "There are no recipients for ${patientProductStock}"
			return true;
		}
	}
	
	private getRecipientsToNotify(PatientProductStock patientProductStock) {
		User.withCriteria {
			projections { distinct("email") }
			isNotNull("email")
			like("email", '%@%')
			eq('enabled',true)
			
			if(patientProductStock?.patient?.country != null) {
				countries {
					eq("id", patientProductStock?.patient?.country?.id)
				}
			}
		}
	}
	
	private getCandidateProductsToNotify() {
		// First fetch all the diferent products available to notify
		PatientProductStock.withCriteria {
			projections { distinct("product") }
			isNull("next") // Is the last item of the linked list!
			eq("notified", false)
		}
	}
}