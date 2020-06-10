class A {

	method m1() { return "A.m1" }

	method m2() { return "A.m2" }

	method m3() { return "A.m3" }
}

class B inherits A {

	override method m1() { return "B.m1 " + super() }

	override method m2() { return "B.m2 " + self.m3() }

	method m4() { return "B.m4" }
}

class C inherits B {

	override method m1() { return "C.m1" }

	override method m2() {
		return "C.m2 " + super() + " " + self.m4()
	}

	override method m3() { return "C.m3" }
}