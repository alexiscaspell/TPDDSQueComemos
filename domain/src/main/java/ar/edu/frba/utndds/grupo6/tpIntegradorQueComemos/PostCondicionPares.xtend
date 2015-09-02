package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List

class PostCondicionPares implements PostCondiciones {

	override aplicarPostCondicion(List<Receta> recetas) {
		recetas.filter[(recetas.indexOf(it) % 2) == 0].toList
	}
}
