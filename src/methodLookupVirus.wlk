class Virus {
	var potencia = 1000
	var cantidadDeInfectados = 0
	
	method infectar(cuerpo) {
		potencia -= cuerpo.peso()
		cantidadDeInfectados += 1
	}
	
	method potencia() {
		return potencia
	} 
	
	method tieneExperiencia() {
		return cantidadDeInfectados > 3
	} 	
	
	method quiereInfectar() {
		return potencia > 500
	} 
}


class VirusGordito inherits Virus {
	var peso = 20
	override method infectar(cuerpo) {
		peso += cuerpo.peso() / 100.0
	}
	
	method peso()  {
		return peso
	}
}


class VirusRechonchito inherits VirusGordito {
	override method quiereInfectar()  {
		return super() and self.peso() > 100
	}
}

class VirusConLiquido inherits Virus {
	var dosisLiquido = 20
	override method infectar(cuerpo) {
		super(cuerpo)
		dosisLiquido -= 1
	}

	method comerMiel() {
		dosisLiquido += 15
	}
}

class VirusConLiquidoDenso inherits VirusConLiquido {
	var densidad = 10
	override method infectar(cuerpo) {
		super(cuerpo)
		densidad -= 2
	}

	override method comerMiel() {
		super()
		densidad += 5
	}

	method estaRobusto() { 
		return densidad > 10 and self.potencia() > 2000
	}
	
	override method quiereInfectar() {
		return super() and densidad > 4
	} 
}


class VirusMusculoso inherits VirusConLiquidoDenso {
	override method potencia() {
		return super() + 500
	}
}

class Ornitorrinco {
	method peso() {
		return 40
	}
}



