package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente

public interface Usuario {

	//	------------------------------------------- Getters -------------------------------------------
	def List<Receta> getConsultas()
	
	def Sexo getSexo()
	
	def List<String> getPlatosQueNoLeGustan()
	
	def String getNombre()
	
	def List<Condicion> getCondicion()
	
	def Rutina getRutina()
	
	def double getPeso()
	
	def List<Ingrediente> getPreferenciasAlimenticias()
	
	def List<Receta> getRecetas()
	
	def List<Receta> getRecetasConAcceso() 	
	//	------------------------------------------- Metodos -------------------------------------------
	def void agregarGrupo(Grupo grupo)
	
	def boolean puedeComer(Receta receta)
	
	def boolean comparteGrupo(Usuario usuario)
	
	def boolean estadoRutina()
	
	def boolean usuarioValido()
	
	def boolean sePuedeSugerir(Receta receta) 
	
	// -------------------------------------------- Metodos Observer y Alternativa---------------------
	
	def void addObservador(Observador observador) 

	def void removeObservador(Observador observador) 
	
	def void notificar() 
	
}
