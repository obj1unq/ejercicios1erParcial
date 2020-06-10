object comedero {
	var deposito = new Deposito()

	method alimentar(unAnimal) {
		if (unAnimal.esVaca()) {
			deposito.descontarPasto(1)
			unAnimal.darPasto(1)

			deposito.descontarAlfalfa(2)
			unAnimal.darAlfalfa(2)

			deposito.descontarVitaminas(3)
			unAnimal.darVitaminas(3)

			deposito.descontarAgua(2)
			unAnimal.darAgua(2)
		} 
		if (unAnimal.esCaballo()) {
			deposito.descontarPasto(1)
			unAnimal.darPasto(1)

			deposito.descontarAlfalfa(2)
			unAnimal.darAlfalfa(2)

			//los caballos necesitan vitaminas distintas 
			//con respecto a las vacas
			deposito.descontarVitaminas(4)
			unAnimal.darVitaminas(4)

			deposito.descontarAgua(2)
			unAnimal.darAgua(2)
		} 

		if (unAnimal.esPerro()) {
			deposito.descontarCarne(0.5)
			unAnimal.darCarne(0.5)

			deposito.descontarAgua(2)
			unAnimal.darAgua(2)
		}
	}
}

class Animal {
	var tipoDeAnimal
	var aguaConsumida = 0
	var energia = 100
	var vitaminasConsumidas = 0

	constructor(_tipo) {
		tipoDeAnimal = _tipo
	}
	//Mensajes/Metodos para saber que animal es
	//solo usados por el comedero
	method esVaca() { return tipoDeAnimal == "vaca" }
	method esCaballo() { return tipoDeAnimal == "caballo" }
	method esPerro() { return tipoDeAnimal == "perro" }

	//Mensaje/Metodo que interesa ser consultado 
	//para cualquier animal
	method estaContento() {
		return ( aguaConsumida * 10 / energia > 1 ) 
		or ( aguaConsumida > 10 and
		energia > 200 and vitaminasConsumidas > 0 )
	}

	/*metodos relacionados con la alimentacion */
	method darAgua(litros) { aguaConsumida += litros }
	method darVitaminas(cantidad) { vitaminasConsumidas += cantidad }

	method darCarne(kilos) {
		if (not self.esPerro()) {
			error.throwWithMessage(
			"Solo los carnivoros pueden consumir carne")
		} 
		energia += kilos * 2
	}

	method darAlfalfa(kilos) {
		if (not self.esCaballo() or self.esVaca()) {
			error.throwWithMessage("
			Solo el ganado pueden consumir alfalfa")
		} 
		energia += kilos
	}

	method darPasto(kilos) {
		if (not self.esCaballo() or self.esVaca()) {
			error.throwWithMessage(
			"Solo el ganado pueden consumir pasto")
		} 
		energia += kilos * 0.1
	}
}

//Desde aca para abajo asumir que es todo correcto
//Las clases Deposito y Alacena
//estan escritas para contextualizar el codigo anterior

class Deposito {
	var litrosDisponiblesAgua = new Alacena(1000)
	var kilosDisponiblesAlfalfa = new Alacena(500)
	var kilosDisponiblesPasto = new Alacena(500)
	var kilosDisponiblesCarne = new Alacena(100)
	var unidadesDisponiblesVitaminas = new Alacena(200)

	method descontarPasto(kilos) { kilosDisponiblesPasto.decrementar(kilos) }

	method descontarAlfalfa(kilos) {
		kilosDisponiblesAlfalfa.decrementar(kilos)
	}

	method descontarAgua(litros) { litrosDisponiblesAgua.decrementar(litros) }
	method descontarCarne(kilos) { kilosDisponiblesCarne.decrementar(kilos) }
	method descontarVitaminas(unidades) {
		unidadesDisponiblesVitaminas.decrementar(unidades)
	}
}
class Alacena {
	var disponible

	constructor(_disponible) {
		disponible = _disponible
	}

	method decrementar(unaCantidad) {
		if (unaCantidad > disponible) {
			error.throwWithMessage(
			"No hay " + unaCantidad + 
			" disponible. Maximo: " +
			disponible)
		}
		disponible -= unaCantidad
	}
}
