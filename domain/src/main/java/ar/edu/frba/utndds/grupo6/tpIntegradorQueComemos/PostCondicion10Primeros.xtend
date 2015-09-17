package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List

class PostCondicion10Primeros implements PostCondiciones {

	override aplicarPostCondicion(List<Receta> recetas) {
		recetas.filter[recetas.indexOf(it) < 10].toList
	}
}
