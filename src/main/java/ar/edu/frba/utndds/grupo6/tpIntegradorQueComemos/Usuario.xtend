package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List

interface Usuario {
	
	def double calcularIMC()
	
	def void agregarReceta()
	
	def void estadoRutina()
	
	def double getPeso()
	
	def double getAltura()
	
	def Rutinas getRutina()
	
	def List<String> getPreferenciasAlimenticias()
}
