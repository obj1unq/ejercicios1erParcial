
class Guitarra {
	var cuerdas = 6
	method cuerdas() = cuerdas
	method cuerdas(_cuerdas) { cuerdas = _cuerdas }	
	method volumen() { return cuerdas * 10 }

}
class GuitarraElectrica inherits Guitarra{
	var equipo
	method equipo() { return equipo }
	method equipo(_equipo) { equipo = _equipo }
	override method volumen() {
		return super() * equipo.ganancia()
	}	
}

class Equipo {
	var ganancia = 10	
	method ganancia() = ganancia
	method ganancia(_ganancia) { ganancia = _ganancia }
}