class Empleado {
	var bonificacion = 0
	
	method bonificar(unNumero) { bonificacion = unNumero } 
	method bonificacion() { return bonificacion }
	method preferido() { return self }
}

class Jefe inherits Empleado {

	var subordinados = #{}
	
	method addEmpleado (unEmpleado) { subordinados.add(unEmpleado) }

	override method bonificar(unNumero) {
		bonificacion = bonificacion.max(unNumero)
		subordinados.forEach(
			{subordinado => subordinado.bonificar(unNumero)}
		)
	}
	
	override method preferido() {
		return subordinados.min(
			{subordinado => subordinado.bonificacion()}
		)	
	}
	
}