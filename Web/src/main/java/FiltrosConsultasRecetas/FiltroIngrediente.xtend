package FiltrosConsultasRecetas

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente

class FiltroIngrediente implements FiltroInterface{
	
	var Ingrediente ingrediente
	
	new(Ingrediente ing){
		ingrediente = ing
	}
	
	override cumple(Receta receta) {
		receta.ingredientes.containsKey(ingrediente)
	}
	
}