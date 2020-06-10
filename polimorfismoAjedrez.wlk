class TableroDeAjedrez {
	method puedeMover(pieza, fila, columna) { 
		var puede
		if (pieza.esPeon()) {
			puede = (pieza.columna() == columna) 
								and (pieza.fila() + 1 == fila)
		} 
		if (pieza.esTorre()) {
			puede = (pieza.columna() == columna) 
								or (pieza.fila() == fila)
		} 		
		if (pieza.esRey()) {
			puede = ((pieza.columna() - columna).abs() <= 1) 
								and ((pieza.fila() - fila).abs() <= 1)
		} 		
		if (pieza.esAlfil()) {
			puede = (pieza.columna() - columna).abs() 
								== (pieza.fila() - fila).abs()
		}
		return puede 
				and not (pieza.estaEn(fila,columna)) 
				and self.esPosicion(fila,columna)
	}
	
	method esPosicion(fila,columna) {
		return fila.between(1,8) and columna.between(1,8)
	}
}

class Pieza {
	var fila
	var columna
	var tipo
	
	method estaEn(f,c) {
		return f == fila and c == columna
	}

	method fila() = fila
	method columna() = columna
	
	method esRey() { return tipo == 'Rey' }
	method esTorre() { return tipo == 'Torre' }
	method esAlfil() { return tipo == 'Alfil' }
	method esPeon() { return tipo == 'Peon' }
}

