class Juguete {
	var color
	constructor(_color) {color = _color} 
	method color(){return color} 
	method color(_color){color = _color} 
}
object pelota {
	method color() {return "rojo"}
	//a la pelota no se le puede cambiar el color
}
class GrupoDeJuguetes {
	var juguetes
	constructor(_juguetes) {juguetes = _juguetes}
	method agregarJuguete(juguete) {juguetes.add(juguete)} 
	method juguetes() {return juguetes}
	method colores() {return juguetes.map({j => j.color()}).asSet()} 
	method pintar(color) {juguetes.forEach({j => j.color(color)})}		
}