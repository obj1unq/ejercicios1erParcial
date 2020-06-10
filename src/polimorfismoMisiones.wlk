class Mision {
	
	var objetivo //Es una instancia de la clase 
			//Objetivo u ObjetivoMultiple)
	var mundo  // Es una instancia de la clase Mundo
	constructor(_objetivo, _mundo) {
		objetivo = _objetivo
		mundo = _mundo
	}		

	method esExitosa() {
		if(objetivo.esSuperviciencia()) {
			return not mundo.destruido() 
					and mundo.tiempoActual() >= objetivo.tiempoDeSupervivencia()
					and mundo.personajeEstaVivo()
		}
		if(objetivo.esParaDerrotarEnemigos()) {
			return not mundo.destruido() 
					and mundo.enemigosDerrotados() >= objetivo.enemigosADerrotar()
		}
		if(objetivo.esParaDefenderAliados()) {
			return not mundo.destruido() 
					and mundo.aliadosCaidos() <= objetivo.aliadosPrescindibles()  			
		}
		if(objetivo.esMultiple()) {
			return self.resolverExitoMultiple(objetivo)
		}	
		error.throwWithMessage("Tipo de objetivo desconocido")	
		return false 
	}
	//metodo auxiliar que devuelve true 
	//si se cumplieron TODOS los objetivos del objetivoMultiple
	method resolverExitoMultiple(objetivoMultiple) {
		var valorRetorno = true
		objetivoMultiple.objetivosInternos().forEach({unObjetivo => 
			if(unObjetivo.esSuperviciencia()) {
				valorRetorno = valorRetorno 
					and not mundo.destruido() 
					and mundo.tiempoActual() >= objetivo.tiempoDeSupervivencia() 
					and mundo.personajeEstaVivo()
			}
			if(unObjetivo.esParaDerrotarEnemigos()) {
				valorRetorno = valorRetorno 
					and not mundo.destruido() 
					and mundo.enemigosDerrotados() >= objetivo.enemigosADerrotar()
			}
			if(unObjetivo.esParaDefenderAliados()) {
				valorRetorno = valorRetorno 
					and not mundo.destruido() 
					and mundo.aliadosCaidos() <= objetivo.aliadosPrescindibles()  			
			}
			if(unObjetivo.esMultiple()) {
				valorRetorno = valorRetorno 
					and self.resolverExitoMultiple(unObjetivo)
					//Si tiene un objetivo multiple dentro de otro llama 
					//al mismo metodo pero con el interno esto funciona 
					//(termina la ejecucion con el resultado esperado)
			}		
									
		}) 	
		return valorRetorno	
	}
}
class Objetivo {
	
	//tiempo que si se supera la mision es exitosa
	var tiempoDeSupervivencia 
	
	//cantidad de enemigos que se deben derrotar para el exito
	var enemigosADerrotar 
	
	//cantidad de aliados maxima que se pueden perder
	//Si se supera se fracasa
	var aliadosPrescindibles 

	//********Metodos para configurar el objetivo************
	
	method configurarComoSupervivencia(_tiempo) {
		tiempoDeSupervivencia = _tiempo
		enemigosADerrotar = null
		aliadosPrescindibles = null	
	}
	
	method configurarParaDerrotarEnemigos(_enemigosADerrotar) {
		tiempoDeSupervivencia = null
		enemigosADerrotar = _enemigosADerrotar
		aliadosPrescindibles = null	
	}
	
	method configurarParaDefenderAliados(_prescindibles) {
		tiempoDeSupervivencia = null
		enemigosADerrotar = null
		aliadosPrescindibles = _prescindibles
	}
	
	//************Metodos para saber el tipo de Objetivo**********
	method esSuperviciencia() {return tiempoDeSupervivencia != null}
	method esParaDerrotarEnemigos() {return enemigosADerrotar != null}
	method esParaDefenderAliados() 	{return aliadosPrescindibles != null}
	method esMultiple() {return false}
	
	//*********Getters para exponer el estado interno *************
	
	method tiempoDeSupervivencia() {return tiempoDeSupervivencia} 
	method enemigosADerrotar() {return enemigosADerrotar}
	method aliadosPrescindibles() {return aliadosPrescindibles}
}

class ObjetivoMultiple {
	//Es una coleccion de objetivos, instancias de las clases
	//Objetivo y/o ObjetivoMultiple
	var objetivosInternos 
	
	constructor (_objetivosInternos) {objetivosInternos = _objetivosInternos}
	//************Metodos para saber el tipo de Objetivo**********
	method esSuperviciencia() {return false}
	method esParaDerrotarEnemigos() {return false}
	method esParaDefenderAliados() 	{return false}
	method esMultiple() {return true}
	//*********Getters para exponer el estado interno *************
	method objetivosInternos(){return objetivosInternos} 
	
}

//La implementacion de esta clase no interesa a los efectos del examen
//Solo se muestran los mensajes que entiende
class Mundo {
	method tiempoActual() //Devuelve el tiempo actual
	method enemigosDerrotados() // Devuelve la cantidad de enemigos derrotados
	method aliadosCaidos() //Devuelve la cantidad de aliados caidos
	method destruido() //Devuelve true si se destruyo el mundo
	method personajeEstaVivo() //Devuelve si el personaje principal esta Vivo
} 

