package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos
import java.util.ArrayList
import java.util.HashMap

public interface Usuario {	

	//Métodos
	
	def void modificarReceta(String nombreReceta, String nuevo_nombre, HashMap<Ingrediente, Integer> ingredientes,
		HashMap<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad,
		ArrayList<Temporada> temporada)
	
	def Receta getReceta(String nombre)
	
	def boolean estadoRutina()	
	
	def boolean usuarioValido()		
			
	//Getters	
	
	def double getPeso()
	
	def Sexo getSexo()
	
	def double getAltura()
	
	def Rutina getRutina()

	def ArrayList<Ingrediente> getPreferenciasAlimenticias()
	
	def Recetario getRecetario()
}
