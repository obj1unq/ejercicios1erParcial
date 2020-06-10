class Pantalla {
	method dibujar(figura) {
		self.prenderCursor()
		if (figura.tipo() == "lineaHorizontal") {
			// en rojo 
			self.lineaDerecha(figura.tamanio(), colorRojo)
			self.moverCursorIzquierda(figura.tamanio())
			// en verde
			self.lineaDerecha(figura.tamanio(), colorVerde)
			self.moverCursorIzquierda(figura.tamanio())
		}
		if (figura.tipo() == "ele") {
			// en rojo 
			self.lineaAbajo(figura.tamanio(),colorRojo)
			self.lineaDerecha(figura.tamanio(), colorRojo)
			self.moverCursorIzquierda(figura.tamanio())
			self.moverCursorArriba(figura.tamanio())
			// en verde 
			self.lineaAbajo(figura.tamanio(),colorVerde)
			self.lineaDerecha(figura.tamanio(), colorVerde)
			self.moverCursorIzquierda(figura.tamanio())
			self.moverCursorArriba(figura.tamanio())
		}
		if (figura.tipo() == "cuadrado") {
			// en rojo 
			self.lineaAbajo(figura.tamanio(),colorRojo)
			self.lineaDerecha(figura.tamanio(), colorRojo)
			self.lineaArriba(figura.tamanio(),colorRojo)
			self.lineaIzquierda(figura.tamanio(),colorRojo)
			// en verde
			self.lineaAbajo(figura.tamanio(),colorVerde)
			self.lineaDerecha(figura.tamanio(), colorVerde)
			self.lineaArriba(figura.tamanio(),colorVerde)
			self.lineaIzquierda(figura.tamanio(),colorVerde)
		}


		if (figura.tipo() == "dobleLineaHorizontal") {
			// en rojo 
			self.lineaDerecha(figura.tamanio(), colorRojo)
			self.moverCursorIzquierda(figura.tamanio())
			self.moverCursorArriba(1)
			self.lineaDerecha(figura.tamanio(), colorRojo)
			self.moverCursorIzquierda(figura.tamanio())
			self.moverCursorAbajo(1)
			// en verde
			self.lineaDerecha(figura.tamanio(), colorVerde)
			self.moverCursorIzquierda(figura.tamanio())
			self.moverCursorArriba(1)
			self.lineaDerecha(figura.tamanio(), colorVerde)
			self.moverCursorIzquierda(figura.tamanio())
			self.moverCursorAbajo(1)
		}
		self.apagarCursor()
	}

	method lineaAbajo(tamanio,color) {
		//implementacion que no interesa ...
	}
	method lineaDerecha(tamanio,color) {
		//implementacion que no interesa ...
	}
	method lineaArriba(tamanio,color) {
		//implementacion que no interesa ...
	}
	method lineaIzquierda(tamanio,color) {
		//implementacion que no interesa ...
	}
	method moverCursorDerecha(cuanto) {
		//implementacion que no interesa ...
	}
	
	method moverCursorAbajo(cuanto) {
		//implementacion que no interesa ...
	}
	method moverCursorIzquierda(cuanto) {
		//implementacion que no interesa ...
	}
	method moverCursorArriba(cuanto) {
		//implementacion que no interesa ...
	}
	method prenderCursor() {
		//implementacion que no interesa ...
	}
	method apagarCursor() {
		//implementacion que no interesa ...
	}

}
	
object colorRojo {
}

object colorVerde {
}

class Figura {
	var tamanio
	var tipo
	
	constructor(_tipo, _tamanio) {
		tipo = _tipo
		tamanio = _tamanio
	}
	method tamanio() { return tamanio }
	method tipo() { return tipo }
}

