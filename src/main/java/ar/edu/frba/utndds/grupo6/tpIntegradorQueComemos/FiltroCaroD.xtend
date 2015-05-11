package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.IngredienteCaro

class FiltroCarosD extends FiltroDecoratorD {
	
		new(Filtro decorado) 
	{
		super(decorado)
	}
	
		
	
	override aplicarFiltro(List <Receta> recetasConocidas, Usuario unUsuario)
	{
		return recetasConocidas.filter[unaReceta |!(unaReceta.getIngredientes()).containsKey( IngredienteCaro )].toList()
		//caros.add(Ingrediente.CARNE)
		
	}
}