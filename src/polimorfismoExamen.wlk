class Alumno {
	method puntaje(examen) {
		var puntos = 0
		examen.preguntas().forEach({ preg =>
			if (preg.tipo() == "Exacta") {
				if (preg.lePegoJusto()) {
					puntos += preg.puntajeQueOtorga()
				}
			}
			if (preg.tipo() == "Aproximada") {
				if (preg.lePegoJusto()) {
					puntos += preg.puntajeQueOtorga() 
				}
				if (preg.respuestaCorrecta() == (preg.respuesta() - 1)) {
					puntos += preg.puntajeQueOtorga() - 2
				}
				if (preg.respuestaCorrecta() == (preg.respuesta() + 1)) {
					puntos += preg.puntajeQueOtorga() - 2
				}
			}
			// en las preguntas de este tipo, la respuesta 
			// es una lista ordenada
			if (preg.tipo() == "Listas") {
				if (preg.lePegoJusto()) {
					puntos += preg.puntajeQueOtorga()
				} else {
					if (preg.respuestaCorrecta().asSet() == 
							preg.respuesta().asSet()) {
						puntos += preg.puntajeQueOtorga() - 5
					}
				}
			}
		})
		if (examen.preguntas().all({preg => preg.contesto()})) {
			puntos += 10
		}
		return puntos
	}
}

class Examen {
	var preguntas
	
	constructor(_preguntas) {preguntas = _preguntas}
	
	method preguntas() = preguntas
}

class Pregunta {
	var respuestaCorrecta
	var respuesta
	var puntajeQueOtorga
	var tipo
	
	constructor(_respuestaCorrecta, _respuesta, _puntajeQueOtorga, _tipo) {
		respuestaCorrecta = _respuestaCorrecta
		respuesta = _respuesta
		puntajeQueOtorga = _puntajeQueOtorga
		tipo = _tipo
	}
	
	method respuestaCorrecta()   {
		return respuestaCorrecta
	}
	method respuesta() {
		return respuesta
	}
	method puntajeQueOtorga()  {
		return puntajeQueOtorga
	}
		
	method lePegoJusto() {
		return self.respuestaCorrecta() == self.respuesta()
	}
	
	method tipo() {
		return tipo
	}
	method contesto() {
		return respuesta != null
	}

}

