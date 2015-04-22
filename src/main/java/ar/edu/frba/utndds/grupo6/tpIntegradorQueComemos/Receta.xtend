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
	private Dificultad dificultad
	
	@Accessors
	private ArrayList<Temporada> temporada	
	
	@Accessors
	private TipoReceta tipo
	
	def String getNombre() {
		return nombre
	}
	
	def HashMap<Ingrediente, Integer> getIngredientes()
	
	def HashMap<Condimento, Integer> getCondimentos()
	
	def String getExplicacion()	
	
	def Dificultad getDificultad() {
		return dificultad
	}
	
	def ArrayList<Temporada> getTemporada() {
		return temporada
	}
	
	def int getCalorias()
	
	def abstract void validar()
	
	def abstract ArrayList<Condicion> condicionesInadecuadas()
	
	def abstract int cantidadDeAzucar()
	
	def boolean puedeSerModificada(Usuario usuario) 
	{
		usuarioCreador.equals(usuario) || tipo == TipoReceta.PUBLICA
	}
	
	def setIngredientes(HashMap <Ingrediente,Integer> ingredientesNuevos) {
		this.ingredientes = ingredientesNuevos
	}
	
	def setNombre(String unNombre) {
		this.nombre=unNombre
	}

	def setCondimentos(HashMap <Condimento,Integer> condimentosNuevos){
		this.condimentos=condimentosNuevos

	}

	def setExplicacion (String unaExplicacion)
	{
		this.explicacion=unaExplicacion
	}

	def setDificultad(Dificultad dificultadReceta)
	{
		this.dificultad=dificultadReceta
	}

	def setTemporada( ArrayList<Temporada> unasTemporadas)
	{
		this.temporada=unasTemporadas
	}

}