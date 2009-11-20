package com.vitaflo.innova

class Country implements Serializable {

    String name
    String code
    
    static constraints = {
        name(blank:false)
    }

    static mapping = {
        table 'countries'
    }

    String toString(){
        return name
    }
}
