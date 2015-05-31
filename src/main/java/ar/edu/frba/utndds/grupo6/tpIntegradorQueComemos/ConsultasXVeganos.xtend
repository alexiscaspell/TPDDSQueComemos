package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Dificultad

class ConsultasXVeganos implements Observador {
	
	private int consultasXVeganos
	
	override actualizar(UsuarioPosta usuario) {
		if ( usuario.getClass().getName() == Condicion.VEGANO )
		{
		//usuario."ATRIBUTO OBSERVADO( RECETAS CONSULTADAS )".forEach[ 
		//	if ( it.getDificultad() == Dificultad.DIFICIL ) consultasXVeganos++
		//]	
		}
		
		    
	}
	
}