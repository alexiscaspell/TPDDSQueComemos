package FiltrosConsultasRecetas

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import queComemos.entrega3.dominio.Dificultad

class FiltroDificultad implements FiltroInterface{
	
	var Dificultad dificultad
	
	new(Dificultad dif){
		dificultad = dif
	}
	
	override cumple(Receta receta) {
		receta.dificultad.equals(dificultad)
	}
	
}