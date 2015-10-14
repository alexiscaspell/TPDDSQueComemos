package FiltrosConsultasRecetas

import java.util.List
import java.util.ArrayList
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import Pedidos.PedidoFiltroConsultaReceta

class Filtrador {
	
	private var List<FiltroInterface> listaFiltros = new ArrayList<FiltroInterface>
		
	private var FactoryFiltros factoryFiltros = new FactoryFiltros()
	
	
	def void crearFiltros(PedidoFiltroConsultaReceta pedido){
		factoryFiltros.pedido = pedido		
		listaFiltros = factoryFiltros.create()
	}
	
	def List<Receta> filtrar(List<Receta> listaReceta){	
		listaReceta.filter[ receta |  listaFiltros.forall[filtro|filtro.cumple(receta)] ].toList		
	}
}