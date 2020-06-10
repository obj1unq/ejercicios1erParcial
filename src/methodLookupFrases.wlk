class YoAprendi {
		method accion()
		method objeto()
		method final()
		method encabezado()  {
			return "yo aprendi a"
		}
		
		method frase() { 
			return self.encabezado() + " " 
				+ self.accion() + " " 
				+ self.objeto() + " " 
				+ self.final()
		}
}

class YoAprendiConfigurable inherits YoAprendi {
		var _accion
		var _objeto
		var _final
		
		constructor(accion,objeto,final) {
				_accion = accion
				_objeto = objeto
				_final = final
		}
			
		override method accion()  { return _accion }
		override method objeto() { return _objeto }
		override method final() { return _final }
}

class YoFui inherits YoAprendiConfigurable {
		constructor(accion,objeto,final) = 
				super(accion,objeto,final)
		
		override method encabezado() {  return "yo fui a" }
}

class YoFuiDeportivo inherits YoFui {
		constructor(accion,objeto,final) = 
				super(accion,objeto,final)
		
		override method accion() { return  super() + " con energia" }
		override method final() { return super() + ", y me gusto" } 
}

class YoAprendiEnEscuela inherits YoAprendi {
		var _escuela
		constructor(escuela) { _escuela = escuela }
		
		override method accion() {
		 	return self.escuela().queEnseniaAHacer()
		}
		override method objeto() { return self.escuela().objeto() } 
		override method encabezado() { return "les cuento que" }
		override method final() {
			return "en la escuela " + self.escuela().nombre()
		} 		
		method escuela() = { return _escuela } 
}
class AprendiBaile inherits YoAprendi {
		override method accion() { return "bailar" } 
}

class AprendiBienBaile inherits AprendiBaile {
		override method accion() {
			return super() + " con precision"
		}
}

class AprendiSalsa inherits AprendiBienBaile {
		var _cuando
		constructor(cuando) { _cuando = cuando }
		
		override method objeto() { return "salsa" } 
		override method final() {
			return self.cuando() + ", y me fue bien"
		}
		method cuando() { return _cuando } 
}

class AprendiSalsaLunes inherits AprendiSalsa {
		constructor(cuando) = super(cuando)
		
		override method cuando() { return super() + " los lunes" } 
}

class Escuela {
		var _nombre
		var _queEnseniaAHacer
		var _objeto
	
		constructor(nombre,queEnsenia,objeto) {
				_nombre = nombre
				_queEnseniaAHacer = queEnsenia
				_objeto = objeto
		}
	
		method nombre() { return _nombre } 
		method queEnseniaAHacer() { return _queEnseniaAHacer } 
		method objeto() { return _objeto }
}
