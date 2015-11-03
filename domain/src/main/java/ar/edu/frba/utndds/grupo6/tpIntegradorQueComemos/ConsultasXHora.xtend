package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.Map
import java.util.Calendar
import java.util.HashMap

class ConsultasXHora extends Observador {

	private Map<Integer, Integer> consultasXHora = new HashMap<Integer, Integer>

	override actualizar(Usuario usuario) {

		if (consultasXHora.containsKey(Calendar.getInstance().get(Calendar.HOUR_OF_DAY))) {
			consultasXHora.put(Calendar.getInstance().get(Calendar.HOUR_OF_DAY),
				consultasXHora.get(Calendar.getInstance().get(Calendar.HOUR_OF_DAY)) + 1)
		} else {
			consultasXHora.put(Calendar.getInstance().get(Calendar.HOUR_OF_DAY), 1)
		}
	}

	def Map<Integer, Integer> getEstadistica() {
		consultasXHora
	}

	override reset() {
		consultasXHora.clear
	}

}
