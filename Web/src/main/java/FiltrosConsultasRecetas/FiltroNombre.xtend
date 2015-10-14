package FiltrosConsultasRecetas

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta

class FiltroNombre implements FiltroInterface{
	
	var String nombre
	
	new(String nom){
		nombre = nom	
	}
	
	override cumple(Receta receta) {
		receta.nombre.equals(nombre)	
	}
	
}