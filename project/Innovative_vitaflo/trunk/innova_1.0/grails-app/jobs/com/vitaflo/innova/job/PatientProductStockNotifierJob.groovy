package com.vitaflo.innova.job

import com.vitaflo.innova.service.PatientProductStockService;

class PatientProductStockNotifierJob {
    PatientProductStockService patientProductStockService

    def concurrent = false
    
    //def cronExpresion = "0 0 0 1 * *" // Every day at 1:00 am

    def timeout = 3600000l // execute job once every 1 hour

    def execute() {
        patientProductStockService.sendPatientsProductStockNotifications();
    }
}

