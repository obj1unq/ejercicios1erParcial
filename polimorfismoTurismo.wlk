class Paquete {

	var cantidadPersonas //un numero
	var servicios //coleccion de instancias de la clase Servicio
	var premium //un booleano 
	var reservado = false

	constructor(_servicios, _cantidadPersonas, _premium) {
		cantidadPersonas = _cantidadPersonas
		servicios = _servicios
		premium = _premium
	}
	
	method estaReservado() {return reservado}
	
	//Se puede reservar si no esta reservado y 
	//TODOS los servicios se pueden reservar
	method sePuedeReservar() {
		
		if(self.estaReservado()) {
			return false
		}
		var todosSePuedenReservar = true
		servicios.forEach({unServicio => 
			
			if(unServicio.esHotel()) {
				//Un hotel se puede reservar si hay lugares disponibles. 
				//Ademas, si el paquete es premium el hotel tiene que ser
				//como minimo de 4 estrellas
				todosSePuedenReservar = todosSePuedenReservar and
					unServicio.lugaresDisponibles() >= cantidadPersonas and
					(not premium or unServicio.estrellas() >= 4)					 
			}
			if(unServicio.esVehiculoParaTralado()) {
				//Un traslado se puede reservar si el vehiculo cuenta con 
				//lugares disponibles y tiene la verificacion tecnica al dia.
				//Si el paquete es premium, tambien tiene que cumplir que  
				//tenga aire Acondicionado
				todosSePuedenReservar = todosSePuedenReservar and
					unServicio.lugaresDisponibles() >= cantidadPersonas and
					unServicio.tieneVTV() and
					(not premium or unServicio.tieneAireAcondicionado())					 
			}
			if(unServicio.esTour()) {
				//Un tour tiene un vehiculo para traslado y opcionalmente 
				// seguridad privada
				//Para que se pueda reservar se tienen que cumplir todas las 
				//condiciones sobre el vehiculo (que son las mismas que se 
				//piden  a los servicios que son vehiculos para traslados)
				// Ademas, el tour tiene que tener espacio disponible que es 
				//independiente de los lugares del vehiculo. (Por ejemplo, 
				//se puede hacer un tour para 10 personas en una combi para 15).
				// Si es premium, el tour tiene que tener seguridad privada
				
				todosSePuedenReservar = todosSePuedenReservar and
					unServicio.lugaresDisponibles() >= cantidadPersonas and
					unServicio.vehiculoTrasladoDeTour().lugaresDisponibles() 
							>= cantidadPersonas and 
					unServicio.vehiculoTrasladoDeTour().tieneVTV() and
					(not premium or 
					(unServicio.vehiculoTrasladoDeTour().tieneAireAcondicionado()
						and unServicio.tieneSeguridadPrivada()))					 
			}
		})
		return todosSePuedenReservar
	}

	//Cuando se reserva se cambia el estado y se modifican los lugares 
	//disponibles en los servicios
	// IMPORTANTE: Analizar que sucede si se pide reservar a un paquete 
	// que no cumple  con las condiciones. 
	//Modificar en caso de que la estrategia fuera incorrecta	
	method reservar() {		
		reservado = true
		servicios.forEach( {unServicio => 
			unServicio.lugaresDisponibles(
				unServicio.lugaresDisponibles()-cantidadPersonas)
			if(unServicio.esTour()) {
				unServicio.vehiculoTrasladoDeTour().lugaresDisponibles(
					unServicio.vehiculoTrasladoDeTour().lugaresDisponibles() 
						- cantidadPersonas)
					}
		})		
	}

}

class Servicio {
	
	var lugaresDisponibles //lugares disponibles del SERVICIO
	var estrellas = 1//cantidad de estrellas del HOTEL
    var aireAcondicionado = false //si el VEHICULO tiene  aire acond.
    var vtv = true //si el VEHICULO tiene la vtv
    var seguridadPrivada = false //si el TOUR tiene seguridad privada
    var vehiculoParaTrasladoDeTour = null // es otra instancia de 
    									//Servicio que tiene la 
    							        //informacion del vehiculo 
    							        //que usa el TOUR
   
   	var esHotel = false
   	var esTour = false
   	var esVehiculoParaTraslado = false 
   
	constructor(_lugaresDisponibles) {
		lugaresDisponibles=  _lugaresDisponibles
	}
	method configurarComoHotel(_estrellas) {
		esHotel = true
		esTour = false
		esVehiculoParaTraslado = false
		estrellas = _estrellas
	}
	method configurarComoVehiculo(_tieneAire, _tieneVtv) {
		esHotel = false
		esTour = false
		esVehiculoParaTraslado = true
		aireAcondicionado = _tieneAire
		vtv = _tieneVtv
	}
	method configurarComoTour(_vehiculoTraslado, _seguridadPrivada) {
		esHotel = false
		esTour = true
		esVehiculoParaTraslado = false
		vehiculoParaTrasladoDeTour = _vehiculoTraslado
		seguridadPrivada = _seguridadPrivada
	}
	
	method lugaresDisponibles() {return lugaresDisponibles}
	method lugaresDisponibles(_lugaresDisponibles) {
		lugaresDisponibles = _lugaresDisponibles
	}
	method esHotel() {return esHotel}
	method esTour() {return esTour}
	method esVehiculoParaTralado() {return esVehiculoParaTraslado}
	method estrellas() {return estrellas}
	method tieneAireAcondicionado() {return aireAcondicionado}
	method tieneVTV() {return vtv}
	method vehiculoTrasladoDeTour() {return vehiculoParaTrasladoDeTour}
	method tieneSeguridadPrivada() {return seguridadPrivada}
}