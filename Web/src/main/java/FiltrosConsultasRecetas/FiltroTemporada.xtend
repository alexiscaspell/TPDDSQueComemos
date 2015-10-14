package FiltrosConsultasRecetas

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada

class FiltroTemporada implements FiltroInterface{
	
	var Temporada temporada
	
	new(Temporada temp){
		temporada = temp
	}
	
	override cumple(Receta receta) {
		receta.temporadas.contains(temporada)		
	}
	
}