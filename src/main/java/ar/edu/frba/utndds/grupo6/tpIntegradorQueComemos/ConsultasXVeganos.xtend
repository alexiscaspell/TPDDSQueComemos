package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import queComemos.entrega3.dominio.Dificultad

//import java.util.ArrayList
//import java.util.List

class ConsultasXVeganos implements Observador {
	
	private int consultasXVeganos = 0
	 
	
	override actualizar(Usuario usuario) {
		println("EN ACTUALIZAR CONSULTAS X VEGANOS " + usuario.getClass().getName() )
		
		/*
		if ( usuario.getCondicion().contains( Condicion.VEGANO ) )
		{
		println("EL usuario " + usuario.nombre + "es VEGANO")	
		usuario.getConsultas().forEach[ 
			if ( it.getDificultad() == Dificultad.DIFICIL ) consultasXVeganos++
		]	
		} */		    
	}
	
	def int getEstadistica(){
		consultasXVeganos
	}
	
	override reset() {
		consultasXVeganos =  0
	}
	
}