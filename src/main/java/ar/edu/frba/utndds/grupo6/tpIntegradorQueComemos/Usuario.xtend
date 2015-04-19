package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

interface Usuario {
	
	def double calcularIMC()
	def void agregarReceta()
	def boolean estadoRutina()
	
	def double getPeso()
	def double getAltura()
	def int getRutina()
}
