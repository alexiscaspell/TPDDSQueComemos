package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List

class FiltroCondicionesPreexistentesS implements TipoDeFiltroS {

	override aplicarFiltro(List<Receta> recetasConocidas, Usuario usuario) {
		return recetasConocidas.filter[condicionesInadecuadas.contains(usuario.getClass().getName())].toList()

	}

}
