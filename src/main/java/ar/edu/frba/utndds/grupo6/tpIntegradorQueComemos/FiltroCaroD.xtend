package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import java.util.Map

class FiltroCarosD extends FiltroDecoratorD {
	
		new(Filtro decorado) 
	{
		super(decorado)
	}
	
		
	override aplicarFiltro(List<Receta> recetasConocidas, Usuario usuario) {
		return recetasConocidas.filter[ getSoloIngrediente( it.getIngredientes() ) ].toList() 
	}

	
	def boolean getSoloIngrediente(Map<Ingrediente, Integer> ingrediente)
	{
		for ( Ingrediente key : ingrediente.keySet()) {
			if ( key.esCaro() ) return false
			
		}
		return true
	}
}