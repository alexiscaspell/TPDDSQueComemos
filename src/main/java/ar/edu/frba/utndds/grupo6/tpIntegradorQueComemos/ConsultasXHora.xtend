package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.Map
import java.util.Calendar
import java.util.HashMap

class ConsultasXHora implements Observador {
	
	private Map< Integer , Integer> consultasXHora = new HashMap< Integer, Integer >
	private Calendar calendario = Calendar.getInstance();
	
	
	override actualizar( Usuario usuario ) {
		
		//println("EN ACTUALIZAR CONSULTAS X HORA ")
		
		 
		if ( consultasXHora.containsKey( calendario.get(Calendar.HOUR_OF_DAY ) )) {
			consultasXHora.put( calendario.get( Calendar.HOUR_OF_DAY ) , consultasXHora.get(calendario.get( Calendar.HOUR_OF_DAY )) + 1 )	
		} else {
			
			consultasXHora.put( calendario.get( Calendar.HOUR_OF_DAY ), 1 )
		}
		//println("Cantidad de consultas x hora hechas " + consultasXHora.get( Calendar.HOUR_OF_DAY ))
	}
	
	def Map< Integer , Integer> getEstadistica(){
		consultasXHora
	}
	
	override reset() {
		consultasXHora.clear
	}
	
}