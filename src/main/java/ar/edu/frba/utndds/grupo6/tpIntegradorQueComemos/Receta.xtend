package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.HashMap

public abstract class Receta {
	
	private Usuario usuarioCreador
	
	private String nombre
	
	private HashMap<Ingrediente, Integer> ingredientes
	
	private HashMap<Condimento, Integer> condimentos
	
	private String explicacion
	
	private int calorias
	
	private Dificultad dificultad
	
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
}