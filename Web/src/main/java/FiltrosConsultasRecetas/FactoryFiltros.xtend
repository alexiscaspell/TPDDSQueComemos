package FiltrosConsultasRecetas

import java.util.List
import Pedidos.PedidoFiltroConsultaReceta
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario

class FactoryFiltros {
	
	@Accessors
	var PedidoFiltroConsultaReceta pedido
	
	@Accessors
	var Usuario usuario
	
	def List<FiltroInterface> create(){
		
		var List<FiltroInterface> filtros = new ArrayList<FiltroInterface>
		
		if(pedido.nombre.trim()!= null){
			filtros.add(new FiltroNombre(pedido.nombre))
		} 			
		if(pedido.dificultad != null){
			filtros.add(new FiltroDificultad(pedido.dificultad))
		}
		if(pedido.ingrediente != null){
			filtros.add(new FiltroIngrediente(pedido.ingrediente))
		}
		if(pedido.maximoCalorias > pedido.minimoCalorias && pedido.minimoCalorias >= 0){
			filtros.add(new FiltroCalorias(pedido.minimoCalorias, pedido.maximoCalorias))
		}
		if(pedido.temporada != null){
			filtros.add(new FiltroTemporada(pedido.temporada))
		}
		
		if(pedido.filtrosUsuario){
			filtros.add(new FiltroFiltrosUsuario(usuario))
		}
		
		return filtros
	}
	
}