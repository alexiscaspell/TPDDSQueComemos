package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList

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
	
}