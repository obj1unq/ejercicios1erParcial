class Animal {
	var duenio
	method duenio() = duenio
	method duenio(_duenio) { duenio = _duenio }
	method aguante() { return 3 }
}
class Perro inherits Animal {
	override method aguante() { return super() + 2 }
} 

class Duenio {  }
