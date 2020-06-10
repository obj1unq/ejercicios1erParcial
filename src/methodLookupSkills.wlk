class Junior {
	method actividades() {
		return self.burocracia() + self.programacion()
	}
	method burocracia() {
		return ["cargar horas"]
	}
	method programacion() {
		return ["resolver issues"]
	}
}
class SemiSenior inherits Junior {
	override method programacion () {
		return super() + ["detectar issues"]
	}
	override method actividades() { 
		return super() + self.planificacion()
	}
	method planificacion() {
		return ["estimar issues"]
	}
}
class Senior inherits SemiSenior {
	override method programacion() {
		return ["refactorizar arquitectura"] + super()
	}
	override method planificacion() {
		return ["coordinar reunion"] + self.demos()
	}	
	method demos() {
		return ["coordinar demo"]
	}
	override method burocracia() {
		return []
	}
}
class Ninja inherits Senior {
	override method programacion() {
		return ["resolver todo"]
	}
	override method demos() {
		return ["salvar demo"]
	}
}
class Acomodado inherits Junior { //OJO!! Mira bien de quien hereda!!
	override method programacion() {
		return []
	}
	override method burocracia() {
		return ["tomar cafe"] + super() 
	}
}