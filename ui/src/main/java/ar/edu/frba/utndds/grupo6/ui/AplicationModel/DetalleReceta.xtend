package ar.edu.frba.utndds.grupo6.ui.AplicationModel

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class DetalleReceta {
	
	private Receta receta;
	
	new (Receta receta)
	{
		this.receta = receta;
	}
	
	def Receta getReceta()
	{
		return receta;
	}	
	
	def void setReceta(Receta receta)
	{
		this.receta = receta;
	}
	
	def String nombreReceta()
	{
		return this.receta.nombre
	}
	
	def String caloriasReceta()
	{
		return this.receta.calorias.toString() + " Calorías."
	}
	
	def String autorReceta()
	{
		return "Creado por " + this.receta.usuarioCreador.nombre
	}
	
	def String dificultadReceta()
	{
		return this.receta.dificultad.toString()
	}
	
	def temporadasReceta()
	{
		return this.receta.temporadas
	}
	
	def String explicacionReceta()
	{
		return this.receta.explicacion
	}
	
	def esFavorita()
	{
		return true;
	}
	
}	