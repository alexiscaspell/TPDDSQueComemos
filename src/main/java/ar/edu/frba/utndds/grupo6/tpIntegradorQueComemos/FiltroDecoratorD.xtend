package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List

abstract class FiltroDecoratorD extends Filtro {
	
	Filtro filtroDecorado
	
	new(Filtro filtro) 
	{
		filtroDecorado= filtro
	}
	
	override aplicarFiltro(List<Receta> recetasConocidas, Usuario unUsuario)
	{
		filtroDecorado.aplicarFiltro(recetasConocidas, unUsuario)
	}
	
}