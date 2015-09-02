package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

interface Observador {

	def void actualizar(Usuario usuario);

	def void reset();
}
