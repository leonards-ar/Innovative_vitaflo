package com.vitaflo.innova

class Drug {

    String name

    static hasMany = [products:Product]

    static constraints = {
        name(blank:false)
    }

    static mapping = {
        table 'drugs'
    }

    String toString(){
        return name
    }
}
