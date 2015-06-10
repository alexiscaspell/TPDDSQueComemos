package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import queComemos.entrega3.dominio.Dificultad

//import java.util.ArrayList
//import java.util.List

class ConsultasXVeganos implements Observador {
	
	private int consultasXVeganos = 0
	 
	
	override actualizar(Usuario usuario) {		
		if ( usuario.getClass().getName() == "ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioVegano" ){
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