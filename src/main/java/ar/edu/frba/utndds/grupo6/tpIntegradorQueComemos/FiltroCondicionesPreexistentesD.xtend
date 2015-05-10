package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List
import java.util.ArrayList

class FiltroCondicionesPreexistentesD extends FiltroDecoratorD {
	
	
	override aplicarFiltro(List <Receta> recetasConocidas , Usuario unUsuario)
	{
		//HACERRR!!
		//unUsuario.
		
				return recetasConocidas.filter[unaReceta |!(unUsuario.getPlatosQueNoLeGustan()).contains(unaReceta.getNombre()) ].toList()
		
	}
}