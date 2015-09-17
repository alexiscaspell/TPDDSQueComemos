package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import java.util.Map

class FiltroCarosS implements TipoDeFiltroS {

	override aplicarFiltro(List<Receta> recetasConocidas, Usuario usuario) {
		return recetasConocidas.filter[getSoloIngrediente(it.getIngredientes())].toList()
	}

	def boolean getSoloIngrediente(Map<Ingrediente, Integer> ingrediente) {
		for (Ingrediente key : ingrediente.keySet()) {
			if(key.esCaro()) return false

		}
		return true
	}

}
