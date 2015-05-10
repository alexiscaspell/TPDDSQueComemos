package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos
import java.util.ArrayList
import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Dificultad
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import java.util.Map

public interface Usuario {	

	//Métodos
	
	def void modificarReceta(String nombreReceta, String nuevo_nombre, Map<Ingrediente, Integer> ingredientes,
		Map<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad,
		ArrayList<Temporada> temporada)
	
	def Receta getReceta(String nombre)
	
	def boolean estadoRutina()	
	
	def boolean usuarioValido()		
			
	//Getters	
	
	def double getPeso()
	
	def Sexo getSexo()
	
	def double getAltura()
	
	def Rutina getRutina()

	def List<Ingrediente> getPreferenciasAlimenticias()
	
	def Recetario getRecetario()
	
	def List<String> getPlatosQueNoLeGustan()
}
