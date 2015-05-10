package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import java.util.ArrayList

class FiltroCarosS implements TipoDeFiltroS {
	
	
	
	override aplicarFiltro(List<Receta> recetasConocidas, Usuario usuario) {
		val caros = new ArrayList<Ingrediente>()
		caros.add( Ingrediente.CARNE )
		return recetasConocidas.filter[ ! getIngredientes().containsKey( caros )].toList() 
	}
	
}