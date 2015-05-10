package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List

class FiltroPostaS implements FiltroS {
	
	List<TipoDeFiltroS> Filtros
	
	
	
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
	
	override aplicarFiltro( List<Receta> recetasConocidas ){
		
	}
}