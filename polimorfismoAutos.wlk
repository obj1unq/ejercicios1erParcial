object lineaDeEnsamblado {
	method ensamblar(unAuto, unColor) {
		if (unAuto.modelo() == "Fox") {
			unAuto.ponerPuertasDelanteras()
			unAuto.ponerRuedas(4)
			unAuto.ponerRuedaAuxilio()
			unAuto.ponerPuertasTraseras()
			unAuto.ponerVolanteAIzquierda()
		} 
		if (unAuto.modelo() == "Amarok Izq") {
			unAuto.ponerPuertasDelanteras()
			unAuto.ponerRuedas(4)
			unAuto.ponerRuedaAuxilio()
			unAuto.ponerCajuela()
			unAuto.ponerVolanteAIzquierda()
		}
		if (unAuto.modelo() == "Amarok Der") {
			unAuto.ponerPuertasDelanteras()
			unAuto.ponerRuedas(4)
			unAuto.ponerRuedaAuxilio()
			unAuto.ponerCajuela()
			unAuto.ponerVolanteADerecha()
		} 
		unAuto.pintarDe(unColor)
	}
}

class Auto {
	var modelo //Un string que indica el modelo del auto 
	var color //Un string que indica el color del auto
	var cosas = #{ } /* todas las cosas (ruedas, cajuela, etc,) que se  
					  * ponen son objetos  que se agregan a la colección*/

	constructor(unModelo) {
		modelo = unModelo
	}

	method modelo() {
		return modelo
	}

	method pintarDe(unColor) {
		color = unColor
	}

	method color() {
		return color
	}
	/*
	* Todos los métodos poner son parecidos, se escribe la implementación  
	* de uno para tener una idea
	*/
	method ponerPuertasDelanteras() { 
		cosas.add( new PuertasDelanteras())
	}
	method ponerPuertasTraseras() {
		...
	} 
	method ponerRuedaAuxilio () { 
		...
	} 
	method ponerRuedas(unaCantidad) { 
		...
	} 
	method ponerCajuela(unaCantidad) {
		...
	}
	method ponerVolanteAIzquierda() { 
		...
	} 
	
	method ponerVolanteADerecha() { 
		...
	} 
}

test "construir un Amarok con Volante a la izquierda" {
   
    var amarok = new Auto("Amarok Izq")
    lineaDeEnsamblado.ensamblar(amarok, "azul")
    //solo interesa la parte del test donde se muestra la creación
    ...
}
