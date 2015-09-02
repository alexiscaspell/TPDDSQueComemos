package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List

class FiltroExcesoCaloriasS implements TipoDeFiltroS {

	override aplicarFiltro(List<Receta> recetasConocidas, Usuario usuario) {
		return recetasConocidas.filter[getCalorias() < 500].toList()
	}

}
