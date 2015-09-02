package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List

class FiltroNoLeGustaS implements TipoDeFiltroS {

	override aplicarFiltro(List<Receta> recetasConocidas, Usuario usuario) {
		return recetasConocidas.filter[! usuario.getPlatosQueNoLeGustan().contains(it.nombre)].toList()
	}

}
