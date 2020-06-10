
class Viaje {

	var medio //es una instancia de la clase MedioTransporte
	var origen //es una ubicacion
	var destino //es una ubicacion
	
	constructor(_medio, _origen, _destino) {
		medio = _medio
		origen = _origen
		destino = _destino
	}

	/**Devuelve true si el viaje puede ser realizado */
	method esPosible() {

		if(medio.esCaminante()) {
			return self.hayCamino(origen, destino) 
				and self.distancia(origen, destino) < medio.distanciaMaxima()
		}		
		if(medio.esAuto()) {
			return self.hayCalles(origen, destino)
				and self.distancia(origen, destino) < medio.distanciaMaxima() 	
		}
		if(medio.esColectivo()) {
			var paradaSubir = medio.paradaCercana(origen)
			var paradaBajar = medio.paradaCercana(destino)
			var caminante = new MedioTransporte("caminante", 800) 
			var caminoHastaSubida = new Viaje(caminante, origen, paradaSubir)			
			var caminoDesdeBajada = new Viaje(caminante, paradaBajar, destino)			
			return caminoHastaSubida.esPosible() 
				and caminoDesdeBajada.esPosible() 
				and self.distancia(origen,destino) < medio.ditanciaMaxima()
		}

		error.throwWithMessage("No se reconoce el tipo del medio")
	}
	
	//Este es un metodo auxiliar usado solo en esPosible() 
	method distancia(desde, hasta) {
		if(medio.esCaminante()) {
			return navegador.distanciaPeatonal(desde, hasta)
		}
		if(medio.esAuto()) {
			return navegador.distanciaPorCaminoTransitable(desde, hasta)
		}
		if(medio.esColectivo()) {
			var tramos = medio.tramosEntre(desde, hasta)
			var sumatoria = 0
			tramos.foreach({unTramo => 
					sumatoria = sumatoria 
								+ navegador.distanciaPorCaminoTransitable(
											unTramo.origen(), unTramo.destino())
					}) 
			return sumatoria
		}	

		error.throwWithMessage("No se reconoce el tipo del medio")
	}
	
	//Este es un metodo auxiliar usado solo en esPosible()
	//para los autos
	method hayCalles(orig, dest) {
		return navegador.existeCaminoTransitable(orig, dest)
	}
	
	//Este es un metodo auxiliar usado solo en esPosible(), 
	//para los caminantes
	method hayCamino(orig, dest) {
		return navegador.existeCaminoPeatonal(orig, dest)		
	}
}

class MedioTransporte {
	var tipo
	var distanciaMaxima
	var tramos
	
	//constructor para autos y caminantes
	//por eso no interesa inicializar la variable
	//tramos
	constructor (_tipo, _distanciaMaxima){
		tipo = _tipo
		distanciaMaxima = _distanciaMaxima
	}
	
	//si es un colectivo hay que usar este constructor
	//porque si no fallan los metodos tramosEntre y paradaCercana
	constructor (_tipo, _distanciaMaxima, _tramos){
		tipo = _tipo
		distanciaMaxima = _distanciaMaxima
		tramos = _tramos
	}
	
	method esCaminante() {return tipo == "caminante"}
	method esAuto() {return tipo == "auto"}
	method esColectivo() {return tipo == "colectivo"}
	method distanciaMaxima() {return distanciaMaxima}
	
	/**
	 * Para colectivos: devuelve todos los tramos del recorrido 
	 * que hay entre la parada mas cercana al origen 
     * y la parada mas cercana al destino 
	 */
	method tramosEntre(origen, destino) {
		//ATENCION: Esta implementacion usa la variable de 
		//instancia tramos y el metodo self.paradaCercana(ubicacion)	
	}
	/**
	  * Para colectivos: devuelve una ubicacion que esta dentro 
	  * de un tramo del recorrido 
	  */
	method paradaCercana(ubicacion) {
		//ATENCION: Esta implementacion usa la variable de instancia tramos			
	}
}
/**
 * Modela una ubicacion en el mundo.
 * Todas las referencias a un origen, un destino, 
 * un lugar desde o un lugar hasta
 * (en Viaje, TramoDeColectivo y navegador),
 * y las paradas de colectivo, son instancias de esta clase
 */
class Ubicacion {
	//implementacion
}
/**
 * Modela un tramo de un recorrido de un colectivo
 * El recorrido de un colectivo entre dos paradas 
 * es una lista de instancias de esta clase
 */
class TramoDeColectivo {
	method origen() {/*implementacion*/}
	method destino() {/*implementacion*/}
}
object navegador {
	/**Devuelve si existe al menos un camino 
	 * usando caminos peatonales y/o calles */
	method existeCaminoPeatonal(orig, dest) {/*implementacion*/}

	/**Devuelve la distancia entre dos puntos 
	 * usando caminos peatonales y/o calles */
	method distanciaPeatonal(orig, dest) {/*implementacion*/}

	/**Devuelve la distancia entre dos puntos usando calles */
	method distanciaPorCaminoTransitable(orig, dest) {/*implementacion*/}

	/**Devuelve si existe al menos un camino usando calles */
	method existeCaminoTransitable(orig, dest) {/*implementacion*/}	
}
