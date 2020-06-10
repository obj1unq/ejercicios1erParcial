class Civilizacion {
    var _puntajeCientifico
    var _puntajeMilitar
    var _puntajeEconomico
    
    constructor(cien,mil,eco) {
        _puntajeCientifico = cien
        _puntajeMilitar = mil
        _puntajeEconomico = eco
    }

    method puntaje(){
    	return self.puntajeCientifico() 
      + self.puntajeMilitar() + self.puntajeEconomico()
    }

    method puntajeCientifico() {
    	return _puntajeCientifico
    } 
    method puntajeMilitar() {
    	return _puntajeMilitar
    }
    method puntajeEconomico() {
    	return  _puntajeEconomico
    }
}

class CivilizacionComercial inherits Civilizacion {
    var _cantTratadosComerciales
    var _cantEscuelasContables 
  	
    constructor(cien,mil,eco,tratadosCom,escuelasContables) =
    super(cien,mil,eco) {
        _cantTratadosComerciales = tratadosCom
        _cantEscuelasContables = escuelasContables
    }

    override method puntajeEconomico() {
    	return super() 
        + self.cantTratadosComerciales() * self.baseComercio()
  	  }	

    override method puntajeCientifico() {
		return super() 
        + self.cantEscuelasContables() * self.baseComercio()
  	}
    method baseComercio() {
    	return juego.baseComercio()
    }
  	
    method cantTratadosComerciales() {
    	return _cantTratadosComerciales
    } 
    method cantEscuelasContables() {
    	return _cantEscuelasContables
    }
}


class CivilizacionComercialSuper inherits CivilizacionComercial {
    constructor(cien,mil,eco,tratadosCom,escuelasContables) =
        super(cien,mil,eco,tratadosCom,escuelasContables) 

    override method baseComercio() { 
    	return super() * 2
    }
}

class CivilizacionCultural inherits Civilizacion {
    var _cantMuseos
    var _cantUniversidades

    constructor(cien,mil,eco,museos,univs) =
    super(cien,mil,eco) {
        _cantMuseos = museos
        _cantUniversidades = univs
    }
  	
    override method puntaje() {
    	return super() + self.puntajeCultural()
    } 
  	
    method puntajeCultural() {
    	return self.cantMuseos() * juego.baseCultural()
    } 
        
  	
    override method puntajeCientifico() {
	     return super() 
        + self.cantUniversidades() * juego.baseCultural()
  	}
  	
    method cantMuseos() {
    	return _cantMuseos
    }
    
    method cantUniversidades() {
    	return  _cantUniversidades
    }
}

class CivilizacionMilitar inherits Civilizacion {
    constructor(cien,mil,eco) = super(cien,mil,eco) 

    override method puntajeCientifico() { 
    	return  0
    }
    override method puntajeEconomico() {
    	return 0
    }
}

class CivilizacionPoetica inherits CivilizacionCultural {
    var _nombreLiterario
  	
    constructor(cien,mil,eco,museos,univs,nombre) =
    super(cien,mil,eco,museos,univs) {
        _nombreLiterario = nombre
    }
  	
    override method puntaje() {
    	return self.puntajeCultural() 
        + self.nombreLiterario().size() * 5
    }
  
    method nombreLiterario() {
    	return _nombreLiterario
    }
}

object juego {
    var _baseComercio = 0
    var _baseCultural = 0
  	
  	
    method baseComercio(unValor) {
        _baseComercio = unValor
    }
  	
    method baseComercio() {
    	return _baseComercio
    }

    method baseCultural(unValor) {
        _baseCultural = unValor
    }
		
    method baseCultural() {
    	return  _baseCultural
    }
}


