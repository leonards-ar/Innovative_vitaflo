package com.vitaflo.innova

class Pathology {
	
	String name
	Double minDose
	Double maxDose

	static mapping = {
		table 'pathologies'
	}

    static constraints = {
		name(blank:false, nullable:false)
		minDose(nullable: false, min:new Double('0.01'))
		maxDose(nuulable: false, validator: {val, obj -> val >= obj.minDose})
		
    }
	
	String toString() {
		return "${this.name}"
	}
	
	def toStringWithDose() {
		return "${this.name} - (${this.minDose} - ${this.maxDose})"
	}
}
