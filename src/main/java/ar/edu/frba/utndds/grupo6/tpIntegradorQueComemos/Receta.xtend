package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.HashMap
import org.eclipse.xtend.lib.annotations.Accessors

public abstract class Receta {
	
	@Accessors
	private Usuario usuarioCreador
	
	@Accessors
	private String nombre
	
	@Accessors
	private HashMap<Ingrediente, Integer> ingredientes
	
	@Accessors
	private HashMap<Condimento, Integer> condimentos
	
	@Accessors
	private String explicacion
	
	@Accessors
	private int calorias
	
	@Accessors
	private Dificultad dificultad
	
	@Accessors
	private ArrayList<Temporada> temporada	
	
	def Usuario getUsuarioCreador() {
		return usuarioCreador
	}
	
	def String getNombre() {
		return nombre
	}
	
	def HashMap<Ingrediente, Integer> getIngredientes() {
		return ingredientes
	}
	
	def HashMap<Condimento, Integer> getCondimentos() {
		return condimentos
	}
	
	def String getExplicacion() {
		return explicacion
	}	
	
	def Dificultad getDificultad() {
		return dificultad
	}
	
	def ArrayList<Temporada> getTemporada() {
		return temporada
	}
	
	def int getCalorias() {
		return calorias
	}
	
	def abstract void validar()
	
	def abstract ArrayList<Condicion> condicionesInadecuadas()
	
	def abstract int cantidadDeAzucar()
}