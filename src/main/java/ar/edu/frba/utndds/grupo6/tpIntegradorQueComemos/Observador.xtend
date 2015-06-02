package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

interface Observador {
	
	def void actualizar( UsuarioPosta usuario );
	
	def void reset();	
}