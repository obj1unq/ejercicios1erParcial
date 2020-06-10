class Jugador {
	var idolo 
	var goles
	
	constructor (_idolo, _goles) {
		idolo = _idolo
		goles = _goles
	}
	
	method idolo() {return idolo	}
	
	method idolo(_idolo) {idolo = _idolo}
	
	method goles() {return goles}
}

object distefano {
	method idolo() {return self}
	method goles() {return 694}
}

class Equipo {
	var jugadores
	constructor(_jugadores){jugadores = _jugadores}
	method idolos() { return new Equipo(jugadores.map({j=>j.idolo()}))}
	method jugadores() {return jugadores}
	method goleador() {
	  return jugadores.max({unJugador => unJugador.goles()})
	}
	method agregarJugador(jug) { jugadores.add(jug) }
}
