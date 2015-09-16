package AplicationModel

import java.util.Map
import java.util.List
import java.util.ArrayList
import java.util.Collections
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Recetario
import java.util.HashMap

class AlgoritmoReceta {
	
	List<Integer> cantidadConsultas = new ArrayList<Integer>
	List<String> NombreRecetas = new ArrayList<String>
	List<Receta> recetas = new ArrayList<Receta>
	private Recetario  recetario =  Recetario .getInstance()
	Map<String, Integer> map = new HashMap<String,Integer>()
	
	def aplicar(Map<String, Integer> consultas) {
		
		for (Map.Entry<String,Integer> entry : map.entrySet()) {
			cantidadConsultas.add(entry.getValue()) 
		}			
			Collections.sort( cantidadConsultas );
			cantidadConsultas.reverse
	 		cantidadConsultas = cantidadConsultas.drop( cantidadConsultas.size - 10 ).toList  
					   
		for (Map.Entry<String,Integer> entry : map.entrySet()) {
			if ( cantidadConsultas.contains(entry.getValue()) ) NombreRecetas.add(entry.getKey()) 
		}			
		
		println(NombreRecetas)
		NombreRecetas.forEach[ 
			recetas.add( recetario.getReceta( it ) ) 
		]
		
		return recetas	
	}
	
}