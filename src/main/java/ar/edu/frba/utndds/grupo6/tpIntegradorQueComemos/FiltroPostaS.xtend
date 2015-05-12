package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List
import java.util.ArrayList

class FiltroPostaS extends Filtro {
	
	List<TipoDeFiltroS> Filtros
	
	
	new (){
		Filtros = new ArrayList<TipoDeFiltroS>
	}
	
	def void agregarFiltroNoLeGusta(){
		Filtros.add( new FiltroNoLeGustaS )
	}
	
	def void agregarFiltroExcesoCalorias(){
		Filtros.add( new FiltroExcesoCaloriasS )
	}
	
	def void agregarFiltroCondicionesPreexistentes(){
		Filtros.add( new FiltroCondicionesPreexistentesS )
	}
	
	def void agregarFiltroCaros(){
		Filtros.add( new FiltroCarosS )
	}
	
	override aplicarFiltro( List<Receta> recetasConocidas, Usuario usuario ){
		if ( Filtros.size > 0 ) {
			val listaFiltrada = Filtros.head.aplicarFiltro( recetasConocidas, usuario ) 
			Filtros.remove(0)
			aplicarFiltro( listaFiltrada, usuario )  
			} else {
				return recetasConocidas
			}
}
	

}