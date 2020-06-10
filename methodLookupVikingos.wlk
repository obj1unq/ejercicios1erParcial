class Vikingo {

	method accionesDeSaqueo() {
		return self.accionesTesoros() + self.accionesEnemigos()
	}
	method accionesTesoros() {
		return ["saquear tesoros", "fundir oro"]
	}	
	method accionesEnemigos() { return ["matar guerreros"] }
}
class Conde inherits Vikingo {
	
	override method accionesEnemigos () {
		return super() + ["matar familia"]
	}
	override method accionesDeSaqueo() { 
		return super() + self.accionesLugar()
	}
	method accionesLugar() { return ["incendiar lugar"] }
}
class Rey inherits Conde{

	override method accionesEnemigos() {
		return ["reclutar jefes vencidos"] + super()
	}
	override method accionesLugar() {
		return super() + ["echar sal", "arar"]
	}		
	override method accionesTesoros() { return ["dividir tesoros"]}
}
class Profeta inherits Vikingo {

	override method accionesTesoros() { return [] }

	override method accionesEnemigos() {
		return ["predecir futuro de enemigos"]
	}
}

