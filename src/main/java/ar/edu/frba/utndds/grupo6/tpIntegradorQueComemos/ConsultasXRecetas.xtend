package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.Map

class ConsultasXRecetas implements Observador {
	
	private Map< String, Integer > RecetasConsultadas
	
	override actualizar(UsuarioPosta usuario) {
		usuario.getConsultas().forEach[
			if ( ! RecetasConsultadas.containsKey( it.nombre )) RecetasConsultadas.put( it.nombre, 1 )
			else RecetasConsultadas.put(  it.nombre , RecetasConsultadas.get( it.nombre ) + 1)
		]
	}
	
}