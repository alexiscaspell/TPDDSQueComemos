package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors

abstract class FiltroDecoratorD implements FiltroInterfazD {
	
	FiltroInterfazD filtroDecorado
	
	override aplicarFiltro(List<Receta> recetasConocidas, Usuario unUsuario)
	{
		filtroDecorado.aplicarFiltro(recetasConocidas, unUsuario)
	}
	
}