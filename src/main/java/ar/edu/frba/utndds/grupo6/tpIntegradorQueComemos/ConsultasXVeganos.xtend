package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion
import queComemos.entrega3.dominio.Dificultad

//import java.util.ArrayList
//import java.util.List

class ConsultasXVeganos implements Observador {
	
	private int consultasXVeganos = 0
	//private List<Receta> ultimaVersion = new ArrayList<Receta>() 
	
	override actualizar(UsuarioPosta usuario) {
		println("EN ACTUALIZAR CONSULTAS X VEGANOS")
		if ( usuario.getClass().getName() == Condicion.VEGANO )
		{
		usuario.getConsultas().forEach[ 
			if ( it.getDificultad() == Dificultad.DIFICIL ) consultasXVeganos++
		]	
		}		    
	}
	
	def int getEstadistica(){
		consultasXVeganos
	}
	
	override reset() {
		consultasXVeganos =  0
	}
	
}