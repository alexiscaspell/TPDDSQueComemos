package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.Map
import java.util.HashMap

class ConsultasXRecetas implements Observador {
	
	private Map< String, Integer > RecetasConsultadas = new HashMap< String, Integer >
	
	override actualizar(UsuarioPosta usuario) {
		println("EN ACTUALIZAR CONSULTAS X CANTIDAD")
		usuario.getConsultas().forEach[
			if ( ! RecetasConsultadas.containsKey( it.nombre )) RecetasConsultadas.put( it.nombre, 1 )
			else RecetasConsultadas.put(  it.nombre , RecetasConsultadas.get( it.nombre ) + 1)
		]
	}
	
	def Map< String, Integer > getEstadistica(){
		RecetasConsultadas
	}
	
	override reset() {
		RecetasConsultadas.class
	}
	
}