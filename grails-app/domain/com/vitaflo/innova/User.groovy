package com.vitaflo.innova

class User implements Serializable {
    
    String username
    String passwd
    String email
    String firstName
    String lastName
    boolean enabled
    String pass = '[secret]'

    static hasMany = [countries:Country, authorities:Role]
    static transients = ['pass']
    static belongsTo = Role

    static constraints = {
        username(blank:false, unique:true)
        passwd(blank:false)
        email(email:true)
    }

    static mapping = {
        table 'users'
        countries joinTable:[name:'user_to_countries']
    }

    String toString(){
        return username
    }
}
