package com.vitaflo.innova

import grails.converters.JSON

class RemotePatientController {

    def patientProductStockService
    
    def getProducts = {
        def productList = []
        def patientInstance = Patient.findWhere(firstName:params.firstname, lastName: params.lastname)
        if (patientInstance) {
            def patientProductStockList=[]
            //this query gets last ordered date and the last runningOutOfStockDate
            // suppose that exists for a product to entries
            def productStartDate =  PatientProductStock.executeQuery("select p.product, max(p.startDate) from PatientProductStock p where p.next is null and p.patient = ? group by p.product", [patientInstance])
            
            productStartDate.each{ item ->
                patientProductStockList.addAll(PatientProductStock.withCriteria {
                    eq("startDate", item[1])
                    patient {
                        eq("id",patientInstance.id)
                    }
                    product{
                        eq("id",item[0].id)
                    }
                })
            }
            patientProductStockList.each{item ->
                def row = [name: item?.product?.name, lastOrdered: formatDate(date:item?.startDate, format:"dd/MM/yyyy"), deadline:formatDate(date:item?.runningOutOfStockDate, format:"dd/MM/yyyy")]
                productList.add(row)
                
            }
        }
        
        render productList as JSON
        
    }
}
