package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List
import java.util.ArrayList

class FiltroNoLeGustaD extends FiltroDecoratorD {
	
	
	override aplicarFiltro(List <Receta> recetasConocidas, Usuario unUsuario)
	{
		return recetasConocidas.filter[unaReceta |!(unUsuario.getPlatosQueNoLeGustan()).contains(unaReceta.getNombre()) ].toList()
		
	}
}