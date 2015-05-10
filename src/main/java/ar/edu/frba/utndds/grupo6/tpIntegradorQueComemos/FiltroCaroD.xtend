package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List
import java.util.ArrayList
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente

class FiltroCarosD extends FiltroDecoratorD {
	
	
		
	
	override aplicarFiltro(List <Receta> recetasConocidas, Usuario unUsuario)
	{
		val caros = new ArrayList<Ingrediente>()
		caros.add(Ingrediente.CARNE)
		return recetasConocidas.filter[unaReceta |!(unaReceta.getIngredientes()).containsKey(caros)].toList()
		//caros.add(Ingrediente.CARNE)
		
	}
}