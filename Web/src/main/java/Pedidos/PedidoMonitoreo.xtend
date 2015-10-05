package Pedidos

import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import static AplicationModel.Dependencias.*

@Accessors
class PedidoMonitoreo {
	
	List<Receta> recetas = new ArrayList<Receta>();
	String mostrando = "Ranking de recetas mas consultadas"
	
	
	def setRecetas(){
		var receta = new Receta()
		receta.nombre = "Receta mas Consultada"
		recetas.add( receta )
	}	
	
	def masConsultadas(){
		var masConsultadas = consultasXRecetas.estadistica
		var sorted =  masConsultadas.entrySet.sortBy[ value ]
		(0 .. 10 - recetas.size ).forEach[ 
				
		]
			
	}
	
}