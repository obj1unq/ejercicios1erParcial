class Gritador {
	method gritar() {
		return self.gritito() + self.granGrito() + self.final()
	}
	
	method gritito() { return "uy" }
	
	method granGrito() { return "UY" }
	
	method final() { return "!!" }
}

class Gritador1 inherits Gritador{
	override method gritito() { return "ay" }
	
	override method granGrito() {
		return self.gritito() + "AAH" 	
	}
}

class Gritador2 inherits Gritador1 {
	
		override method gritito() { return "aa" + super() }
		
		override method final() {
			return self.granGrito() + super()
		}		
	
		override method gritar() {
			return self.final() + self.granGrito() + self.gritito()
		}
}

class Gritador3 inherits Gritador2 {
	
	override method granGrito() { return "EEE" }
	
	override method final() { return self.gritito() }
}