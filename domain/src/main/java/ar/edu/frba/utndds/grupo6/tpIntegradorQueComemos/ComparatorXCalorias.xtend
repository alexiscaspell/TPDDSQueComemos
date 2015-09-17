package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.Comparator

public class ComparatorXCalorias implements Comparator<Receta> {

	override int compare(Receta r1, Receta r2) {
		return r1.getCalorias().compareTo(r2.getCalorias())
	}
}
