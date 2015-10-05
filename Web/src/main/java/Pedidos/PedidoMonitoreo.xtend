package Pedidos

import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import static AplicationModel.Dependencias.*
import queComemos.entrega3.dominio.Dificultad

@Accessors
class PedidoMonitoreo {
	
	List<Receta> recetas = new ArrayList<Receta>();
	String mostrando = "Ranking de recetas mas consultadas"
	List<Integer> cantidadConsultas = new ArrayList<Integer>();
	
	def setRecetas(){
		var Receta receta1 = new Receta
		receta1.nombre = "Receta mas Consultada"
		receta1.dificultad = Dificultad.FACIL
		receta1.calorias = 500
		recetas.add( receta1 )
		cantidadConsultas.add( 6 )
	}	
	
	def masConsultadas(){
		var masConsultadas = consultasXRecetas.estadistica
		masConsultadas.entrySet.sortBy[ value ]
		masConsultadas.forEach[p1, p2|
			recetas.add ( repoRecetas.getReceta( p1 ) )
			cantidadConsultas.add( p2 )
		]
		// Eliminar todo de recetas menos 10 primeras				
	}
	
}