class Personaje {

  method habilidades() {
  	return self.batalla() + self.extras()
  }
  method batalla()  {
  	return ["disparar laser"]
  }
  method extras() {
  	return ["programar droide"]
  }
}
class Padawan inherits Personaje {
	
	override method batalla() {
		return ["usar sable laser"]
	}
	override method extras() {
		return ["sentir la fuerza"] + super() 
	}
}
class Jedi inherits Padawan {

	override method habilidades() {
		return super() + self.estrategia()
	}
	method estrategia() {
		return ["comandar clones"]
	}	
	override method extras() {
		return ["construir sable", "mover objetos"]	+ super()
	}
}
class MaestroJedi inherits Jedi {

	override method estrategia() {
		return self.jedis() + super()
	}
	method jedis() {
		return ["comandar jedis"]
	}
}
class LordSith inherits MaestroJedi {

	override method habilidades() {
		return self.estrategia() + ["usar lado oscuro"]
	}
	override method jedis() {
		return ["matar jedis"]		
	}
}