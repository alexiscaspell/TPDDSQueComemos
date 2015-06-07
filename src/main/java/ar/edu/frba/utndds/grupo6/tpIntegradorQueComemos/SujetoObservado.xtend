package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

interface SujetoObservado  {
		
	def void addObservador(Observador observador);
	def void removeObservador(Observador observador);
	def void notificar();
	
		
}