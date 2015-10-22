package FiltrosConsultasRecetas

import java.util.List
import java.util.ArrayList
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import Pedidos.PedidoFiltroConsultaReceta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

class Filtrador {
	
	private var List<FiltroInterface> listaFiltros = new ArrayList<FiltroInterface>
		
	private var FactoryFiltros factoryFiltros = new FactoryFiltros()
	
	@Accessors
	private var Usuario usuario
	
	
	def void crearFiltros(PedidoFiltroConsultaReceta pedido){
		
		factoryFiltros.pedido = pedido		
		
		factoryFiltros.usuario = usuario
		
		listaFiltros = factoryFiltros.create()
	}
	
	def List<Receta> filtrar(List<Receta> listaReceta){
		listaReceta.filter[ receta |  listaFiltros.forall[filtro|filtro.cumple(receta)] ].toList		
	}
}