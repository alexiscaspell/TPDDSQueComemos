package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Map
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Dificultad
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion

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
	
	@Accessors
	private Map<Ingrediente, Integer> ingredientes
	
	@Accessors
	private Map<Condimento, Integer> condimentos
	
	@Accessors
	private String explicacion	
	
	def abstract int getCalorias()
	
	def abstract String getExplicacion()
	
	def abstract void validar()
	
	def abstract ArrayList<Condicion> condicionesInadecuadas()
	
	def abstract int cantidadDeAzucar()
	
	def boolean puedeSerModificada(Usuario usuario) 
	{
		usuarioCreador.equals(usuario) || tipo == TipoReceta.PUBLICA
	}
}