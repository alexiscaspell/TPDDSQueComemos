package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.HashMap

public class RecetaCompuesta extends Receta {
	
	private ArrayList<Receta> recetas;
	
	new (ArrayList<Receta> recetas)
	{
		this.recetas = recetas 		
	}
	
	override validar() 
	{
		recetas.forEach[e | e.validar()]
	}
	
	override condicionesInadecuadas() 
	{
		val condicionesInadecuadas = new ArrayList<Condicion>()
		recetas.forEach[x | condicionesInadecuadas.addAll((x.condicionesInadecuadas()))]
		return condicionesInadecuadas
	}
	
	override cantidadDeAzucar() 
	{
		val recetasConAzucar = recetas.filter[x | x.condimentos.containsKey(Condimento.AZUCAR)]
		recetasConAzucar.fold(0, [acum, receta | acum + receta.cantidadDeAzucar()])
	}
	
	override getIngredientes() {
		val ingred = new HashMap<Ingrediente, Integer>()
		for(i : 0..<recetas.length)
		{
			val receta = recetas.get(i)
			ingred.putAll(receta.getIngredientes())
		}
		ingred
	}
	
	override getCondimentos() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getExplicacion() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getCalorias() {
		recetas.fold(0, [acum, receta | acum + receta.calorias])
	}
	
}