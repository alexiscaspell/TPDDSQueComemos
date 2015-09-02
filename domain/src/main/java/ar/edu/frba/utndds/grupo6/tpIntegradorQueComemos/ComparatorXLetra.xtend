package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.Comparator

class ComparatorXLetra implements Comparator<Receta> {

	override int compare(Receta r1, Receta r2) {
		return r1.getNombre().compareTo(r2.getNombre())
	}
}
