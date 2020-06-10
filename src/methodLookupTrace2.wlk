class Abuela {

	method m1() {
		return "A.m1 " + self.m2() + " " + self.m3()
	}
	
	method m2() {
		return "A.m2"
	}
	//abstracto
	method m3()
}

class Madre inherits Abuela {
	override method m2() {
		return "M.m2 " + super() + " " + self.m3()
	}
	
	override method m3() {
		return "M.m3"	
	}
}

class Hija inherits Madre {

	override method m1() {
		return "H.m1 " + self.m3() + " " + super()
	} 
	
}