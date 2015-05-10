package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors

abstract class FiltroDecoratorD extends Filtro {
	
	Filtro filtroDecorado
	
	override aplicarFiltro(List<Receta> recetasConocidas, Usuario unUsuario)
	{
		filtroDecorado.aplicarFiltro(recetasConocidas, unUsuario)
	}
	
}