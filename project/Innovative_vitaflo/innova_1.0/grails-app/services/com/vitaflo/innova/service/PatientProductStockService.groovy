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

    boolean transactional = true

    def updatePatientProductStock(Invoice invoice) {
        if(invoice.deliveryDate != null) {
            Proforma proforma = invoice.getProforma();

            proforma?.getDetails().each {
                def patientProductStock = getPatientProductStock(proforma.patient, it.product, proforma);
                def endDate, startDate

                if(patientProductStock != null) {
                    // It is an update of this invoice
                    if(invoice.deliveryDate > patientProductStock.startDate) {
                        startDate = clearTime(invoice.deliveryDate)
                        endDate = startDate + it.getTotalDoseDays()
                        patientProductStock.startDate = startDate
                        patientProductStock.runningOutOfStockDate = endDate
                        patientProductStock.notified = false;

                        if(!patientProductStock.save()) {
                            patientProductStock.errors.each {
                                log.error it
                            }
                        } else {
                            updateNextPatientProductStock(patientProductStock)
                        }
                    }
                } else {
                    // New record
                    patientProductStock = new PatientProductStock();
                    patientProductStock.patient = proforma.patient;
                    patientProductStock.product = it.product;
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
                            prevPatientProductStock.errors.each {
                                log.error it
                            }
                        }
                    }

                    patientProductStock.runningOutOfStockDate = patientProductStock.startDate + it.getTotalDoseDays();
                    patientProductStock.notified = false;
                    
                    if(!patientProductStock.save()) {
                        patientProductStock.errors.each {
                            log.error it
                        }
                    } else {
                        updateNextPatientProductStock(patientProductStock)
                    }
                }
            }
        }
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
                    current.errors.each {
                        log.error it
                    }
                }

            } else {
                current = current.next
            }
        }
    }

    def sendPatientsProductStockNotifications() {
        listPatientsProductStockToNotify().each { patientProductStock ->
            if(sendNotification(patientProductStock)) {
                patientProductStock.setNotified(true);
                if(!patientProductStock.save(flush:true)) {
                    patientProductStock.errors.each { err ->
                        log.error err
                    }
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
                        product {
                            eq("id", productId)
                        }
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

    private clearTime(Date dt) {
        def strDate = dt.format("yyyy-MM-dd");
        return new Date().parse("yyyy-MM-dd", strDate);
    }

    private sendNotification(PatientProductStock patientProductStock) {
        def recipients = getRecipientsToNotify(patientProductStock).toArray();

        if(recipients != null && recipients.length > 0) {
            try{
                mailService.sendMail {
                    // :TODO: Take from configuration!
                    from "labs@mindpool.com.ar"
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
            projections {
                distinct("email")
            }
            isNotNull("email")

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
            projections {
                distinct("product")
            }
            isNull("next") // Is the last item of the linked list!
            eq("notified", false)
        }
    }
}