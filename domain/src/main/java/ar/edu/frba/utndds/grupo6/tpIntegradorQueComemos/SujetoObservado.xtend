package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.List

abstract class SujetoObservado  {
	
	private List<Observador> Observadores = new ArrayList<Observador>()	
		
		
	def addObservador(Observador observador) {
		Observadores.add(observador)
	}

	def removeObservador(Observador observador) {
		Observadores.remove(observador)
	}
	
	def getObservadores(){
		Observadores
	}
	
	def void notificar()
	
	
	
	
	
		
}