
class Viaje {
	var medio //es una instancia de la clase MedioTransporte
	var origen //es una ubicacion
	var destino //es una ubicacion

	
	constructor(_medio, _origen, _destino) {
		medio = _medio
		origen = _origen
		destino = _destino
	}

	method esPosible() {
		return medio.esPosible(origen, destino)
	}
	
}


class MedioTransporte {
	var distanciaMaxima
	
	constructor (_distanciaMaxima){
		distanciaMaxima = _distanciaMaxima
	}
		
	method distanciaMaxima() {return distanciaMaxima}
	
		
	method esPosible(origen, destino){
		return self.distancia(origen, destino) < self.distanciaMaxima()
	}
	
	method distancia(desde, hasta);
	
	
}

class Auto inherits MedioTransporte {
	constructor(distanciaRapida) = super(distanciaRapida) {
	}	
	
	override method esPosible(origen, destino) {
		return self.hayCalles(origen, destino)
			and super(origen, destino)
	}
	
	method hayCalles(orig, dest) {
		return navegador.existeCaminoTransitable(orig, dest)
	}
	
	override method distancia(orig, dest) {
		return navegador.distanciaPorCallesTransitables(orig, dest)
	}
	
}

class Caminante inherits MedioTransporte {
	constructor(distanciaRapida) = super(distanciaRapida) {
	}
	
	override method esPosible(origen, destino) {
		return self.hayCamino(origen, destino) 
					and super(origen, destino)
	}		
	method hayCamino(orig, dest) {
		return navegador.existeCaminoPeatonal(orig, dest)		
	}
	
	override method distancia(orig, dest) {
		return navegador.distanciaPeatonal(orig, dest)
	}
	
}

class Colectivo inherits MedioTransporte {
	var tramos
	constructor(distanciaRapida, _tramos) = super(distanciaRapida) {
		tramos = _tramos
	}		
	/**
	 * devuelve todos los tramos del recorrido de un colectivo
	 * que hay entre la parada origen y la parada destino
	 */
	method tramosEntre(paradaOrigen, paradaDestino) {
		//Esta implmentación usa la variable de instancia tramos	
	}
	
		/**devuelve una ubicacion que está dentro de un tramo 
       del recorrido de colectivo*/
	method paradaCercana(ubicacion) {
		//Esta implementación usa la variable de instancia tramos			
	}
	
	override method esPosible(origen, destino) {
			var caminante = new Caminante(800) 
			var hastaParada = new Viaje(caminante, origen,  self.paradaCercana(origen))			
			var hastaFinal = new Viaje(caminante, self.paradaCercana(destino), destino)			
			return hastaParada.esPosible() 
					and hastaFinal.esPosible() 
					and super(origen, destino)
		
	}
	
	override method distancia(desde, hasta) {
		self.tramosEntre(desde, hasta).sum{unTramo => unTramo.distancia()}
	}
}


/**
 * Modela una ubicación en el mundo.
 * Los métodos del navegador, el origen y destino de un viaje, 
 * y las paradas de colectivo son instancias de esta clase
 */
class Ubicacion {
	//implementacion
}

/**
 * Modela un tramo recto de un recorrido de un colectivo
 * El recorrido de un colectivo entre dos paradas se calcula
 * como una lista de instancias de esta clase
 */
class TramoDeColectivo {
	method origen() {/*implementacion*/}
	method destino() {/*implementacion*/}
	method distancia() {
		return navegador.distanciaPorCallesTransitables(
								self.origen(), self.destino())
	}
}

object navegador {
	/**Devuelve si existe al menos un camino 
	 * usando caminos peatonales y calles */
	method existeCaminoPeatonal(orig, dest) {
		//implementacion	
	}
	/**Devuelve la distancia entre dos puntos 
	 * usando caminos peatonales, calles */
	method distanciaPeatonal(orig, dest) {
		//implementacion	
	}
	/**Devuelve la distancia entre dos puntos 
	 * usando calles */
	method distanciaPorCallesTransitables(orig, dest) {
		//implementacion	
	}
	/**Devuelve si existe al menos un camino 
	 * usando calles */
	method existeCaminoTransitable(orig, dest) {
		//implementacion	
	}	
}