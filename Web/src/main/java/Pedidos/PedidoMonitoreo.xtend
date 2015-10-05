package Pedidos

import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PedidoMonitoreo {
	
	List<Receta> recetas = new ArrayList<Receta>();
	String mostrando = "Ranking de recetas mas consultadas"

	
	def setRecetas(){
		var receta = new Receta()
		receta.nombre = "Receta mas Consultada"
		recetas.add( receta )
	}	
	
}