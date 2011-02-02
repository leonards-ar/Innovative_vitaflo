package com.vitaflo.innova

class ClinicalHistory {

    Date date = new Date()
    String title
    String description
    Patient patient

    static constraints = {
      date(nullable:false)
      title(nullable:false, blank:false)
      description(blank:false)
    }

    static mapping = {
      table 'clinical_history'
      columns {
        description type: "text"
      }
    }

}
