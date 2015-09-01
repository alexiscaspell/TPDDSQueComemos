package ar.edu.frba.utndds.grupo6.ui.AplicationModel

import java.util.Map

class AlgoritmoReceta {
	
	def aplicar(Map<String, Integer> consultas) {
		consultas.put( "papa", 1)
		consultas.put( "pure", 2)
		consultas.put( "milanesa", 3)
		for (Map.Entry<String,Integer> entry : consultas.entrySet()) {
				println(entry.getValue())
				println(entry.getKey())		   
		}
			
	}
	
}