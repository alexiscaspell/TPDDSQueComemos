package Pedidos

import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import static AplicationModel.Dependencias.*
import AplicationModel.DiezPrimeras

@Accessors
class PedidoMonitoreo {
	
	List<Receta> recetas = new ArrayList<Receta>();
	String mostrando = "Ranking de recetas mas consultadas"
	List<Integer> cantidadConsultas = new ArrayList<Integer>();
	DiezPrimeras diezPrimeras = new DiezPrimeras();
	
	def masConsultadas(){
		var masConsultadas = consultasXRecetas.estadistica
		//println("En PedidoMonitoreo masConsultadas() : " + masConsultadas )
		masConsultadas.entrySet.sortBy[ value ]
		masConsultadas.forEach[p1, p2|
			recetas.add ( repoRecetas.getReceta( p1 ) )	
			cantidadConsultas.add( p2 )
		]
		
		recetas = diezPrimeras.diezPrimeras( recetas )
		}
		// Eliminar todo de recetas menos 10 primeras				
	}
	
