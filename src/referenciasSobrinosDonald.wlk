class Sociable {
	var amigo
	method amigo(_amigo) { amigo = _amigo }
	method amigo() { return amigo }
}

class Ermitanio {
	method amigo() { return self }
}

class Casa {
	var personas = [] //es una LISTA!! (no conjunto)
	
	method agregarPersona(_persona) { personas.add(_persona) }
	method personas() { return personas }
	method masNuevo() { return personas.last() }
}

class Club inherits Casa {
	override method agregarPersona(_persona) {
		super(_persona.amigo())
	}	
}