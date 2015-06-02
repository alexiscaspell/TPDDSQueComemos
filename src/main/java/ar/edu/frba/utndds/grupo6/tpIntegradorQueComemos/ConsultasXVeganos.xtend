package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion
import queComemos.entrega3.dominio.Dificultad

//import java.util.ArrayList
//import java.util.List

class ConsultasXVeganos implements Observador {
	
	private int consultasXVeganos = 0
	 
	
	override actualizar(UsuarioPosta usuario) {
		//println("EN ACTUALIZAR CONSULTAS X VEGANOS")
		if ( usuario.getCondicion().contains( Condicion.VEGANO ) )
		{
		println("EL usuario " + usuario.nombre + "es VEGANO")	
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