package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.IngredienteCaro

class FiltroCarosS implements TipoDeFiltroS {
	
	
	
	override aplicarFiltro(List<Receta> recetasConocidas, Usuario usuario) {
		return recetasConocidas.filter[ ! getIngredientes().containsKey( IngredienteCaro )].toList() 
	}
	
}