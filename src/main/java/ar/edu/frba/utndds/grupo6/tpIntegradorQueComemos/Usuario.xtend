package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos
import java.util.ArrayList
import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import java.util.Map
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import queComemos.entrega3.dominio.Dificultad

public interface Usuario {	

	//Métodos
	
	def void modificarReceta(String nombreReceta, String nuevo_nombre, Map<Ingrediente, Integer> ingredientes,
		Map<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad,
		ArrayList<Temporada> temporada)
	
	def Receta getReceta(String nombre)
	
	def boolean estadoRutina()	
	
	def boolean usuarioValido()		
	
	def void agregarReceta(Receta receta)	
			
	//Getters	
	
	def double getPeso()
	
	def Sexo getSexo()
	
	def double getAltura()
	
	def Rutina getRutina()
	
	def List<Receta> getRecetas() 

	def List<Ingrediente> getPreferenciasAlimenticias()
	
	def List<String> getPlatosQueNoLeGustan()
	
	def List<Receta> getConsultas()
	
	def boolean comparteGrupo(Usuario usuario)
	
	def boolean puedeComer(Receta receta)
	
	def boolean sePuedeSugerir(Receta receta)
	
	def void marcarComoFavorita(Receta receta)
	
	def List<Receta>getRecetasConAcceso(List<Receta> recetas)
	
	def void agregarGrupo(Grupo grupo)
	
	def void addObservador( Observador observador )
	def void removeObservador( Observador observador )
	def void notificar()
	
}
