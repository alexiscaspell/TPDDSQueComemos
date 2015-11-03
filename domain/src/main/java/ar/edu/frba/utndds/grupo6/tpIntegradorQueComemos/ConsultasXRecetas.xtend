package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.Map
import java.util.HashMap

class ConsultasXRecetas extends Observador {

	private Map<String, Integer> recetasConsultadas;

	new() {
		recetasConsultadas = new HashMap<String, Integer>
		println("Haciendo el new de ConsultasXRecetas, recetasConsultadas = " + recetasConsultadas)
	}

	override actualizar(Usuario usuario) {

		//println("EN ACTUALIZAR CONSULTAS X CANTIDAD")
		usuario.getConsultas().forEach [
			if (! recetasConsultadas.containsKey(it.nombre))
				recetasConsultadas.put(it.nombre, 1)
			else
				recetasConsultadas.put(it.nombre, recetasConsultadas.get(it.nombre) + 1)
		]
	}

	def Map<String, Integer> getEstadistica() {
		recetasConsultadas
	}

	override reset() {
		recetasConsultadas.class
	}

}
