package com.vitaflo.innova

/**
 * Authority domain class.
 */
class Role {

    static hasMany = [people: User]

    /** description */
    String description
    /** ROLE String */
    String authority

    static constraints = {
        authority(blank: false, unique: true)
        description()
    }

    static mapping = {
        table 'role'
    }

    String toString(){
        return authority
    }
}
