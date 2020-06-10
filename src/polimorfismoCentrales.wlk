class SistemaInterconectado {
	var centrales = #{ }

	method capacidadDeGeneracion() {
		var total = 0
		centrales.forEach({ central => 
				if (central.esHidrica()) {
					total = total + central.cantTurbinas() * 
									central.potenciaMaxTurbina() * 
									central.caudalActual().max(central.caudadDeSaturacion()) /
									central.caudadDeSaturacion() 
				} 
				if (central.esAtomica()) {
					central.sectores().forEach({ sector => 
						total = total + sector.capacidadDeGeneracion() })
				} if (central.esACarbon()) {
					total = total + central.capacidadInstalada()
				} 
		return total 
		})
	}
}

