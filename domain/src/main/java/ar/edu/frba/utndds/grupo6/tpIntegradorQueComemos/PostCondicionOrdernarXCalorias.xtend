package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List
import java.util.Collections

class PostCondicionOrdenarXCalorias implements PostCondiciones {

	override aplicarPostCondicion(List<Receta> recetas) {
		Collections.sort(recetas, new ComparatorXCalorias());
		return recetas
	}
}
