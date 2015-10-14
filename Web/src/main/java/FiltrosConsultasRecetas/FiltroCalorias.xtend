package FiltrosConsultasRecetas

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta

class FiltroCalorias implements FiltroInterface{
	
	var int maximo
	
	var int minimo
	
	new(int min, int max){
		maximo = max
		minimo = min
	}
	
	override cumple(Receta receta) {
		return (receta.calorias <= maximo && receta.calorias >= minimo)
	}
	
}