class Soldado {

  method habilidades() {
  	return self.batalla() + self.extras()
  }
  method batalla()  {
  	return ["fusil"]
  }
  method extras() {
  	return ["limpiar"]
  }
}
class Cabo inherits Soldado {
	
	override method batalla() {
		return ["artilleria"] + super() 
	}
	override method extras() {
		return ["fumar"] 
	}
}
class Sargento inherits Cabo {

	override method habilidades() {
		return super() + self.estrategia()
	}
	method estrategia() {
		return ["comandar soldados"]
	}	
	override method extras() {
		return ["poker"]	+ super()
	}
}
class Teniente inherits Sargento {

	override method estrategia() {
		return self.politica() + super()
	}
	method politica() {
		return ["contentar al superior"]
	}
}
class Coronel inherits Teniente {

	override method habilidades() {
		return self.estrategia() + ["planificar"]
	}
	override method politica() {
		return ["negociar"]		
	}
}