package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Dificultad
//import java.util.ArrayList
//import java.util.List

class ConsultasXVeganos implements Observador {
	
	private int consultasXVeganos
	//private List<Receta> ultimaVersion = new ArrayList<Receta>() 
	
	override actualizar(UsuarioPosta usuario) {
		if ( usuario.getClass().getName() == Condicion.VEGANO )
		{
		usuario.getConsultas().forEach[ 
			if ( it.getDificultad() == Dificultad.DIFICIL ) consultasXVeganos++
		]	
		}		    
	}
	
}