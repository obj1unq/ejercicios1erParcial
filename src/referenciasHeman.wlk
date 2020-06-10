object heman {
	var transformado = false
	method gritoDeGuerra() {transformado = true}
	method fuerza() {return if(transformado) 2000 else 10 }
}
class MasterOfUniverse {
	var fuerza = 20
	method fuerza() {return fuerza}
	method gritoDeGuerra() {fuerza = fuerza + 10}	
}
class Castillo {
	var maestros = #{}
	method agregarMaestro(maestro) {maestros.add(maestro)}
	method maestros() {return maestros}
	method enfurecer() {
		return maestros.forEach({m=>m.gritoDeGuerra()})
	}
	method masFuerte() {return maestros.max({m=>m.fuerza()})}
}