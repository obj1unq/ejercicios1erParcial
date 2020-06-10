object popeye {
	var comio = false
	method comerEspinaca() {comio = true}
	method fuerza() {return if(comio) 1000 else 5 }
}
class Marinero {
	var fuerza = 10
	method fuerza() {return fuerza}
	method comerEspinaca() {fuerza = fuerza + 10}	
}
class Barco {
	var marineros = #{}
	method agregarMarinero(marinero) {marineros.add(marinero)}
	method marineros() {return marineros}
	method alimentarMarineros() {
		return marineros.forEach({m=>m.comerEspinaca()})
	}
	method masFuerte() {return marineros.max({m=>m.fuerza()})}
}