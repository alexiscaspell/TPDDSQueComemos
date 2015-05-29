package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.Map

class RecetasConsultadas implements Observador {
	
	private Map< String, Integer > RecetasConsultadas
	
	override actualizar(UsuarioPosta usuario) {
		// Mirar recetas conocidas por el usuario y agregar +1 a cada uno..?
		// Como evitar repeticion de recetas ya contadas
	}
	
}