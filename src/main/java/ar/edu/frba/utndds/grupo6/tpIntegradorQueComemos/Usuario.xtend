package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.Date
import java.util.ArrayList

interface Usuario {
	
	
	
	def boolean estadoRutina()
	def boolean cumpleCondicion()
	def boolean nombreCorrecto()
	def boolean cumpleCamposObligatorios()
	def boolean usuarioValido()
	def boolean agregarUsuario(String nombre, double peso, double altura, Date fechaNacimiento, int rutinaUsuario)
	
	def void agregarReceta()
	def void setNombre(String nombre)
    def void setFechaNacimiento(Date fecha)
	
	def double calcularIMC()
	def double getPeso()
	def double getAltura()
	def ArrayList<String> getPreferenciasAlimenticias()
	
	def int getRutina()
	
}
