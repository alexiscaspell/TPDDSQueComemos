package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List

class FiltroCondicionesPreexistentesD extends FiltroDecoratorD {
	
	
	new(Filtro decorado) 
	{
		super(decorado)
	}
	
	
	override aplicarFiltro(List <Receta> recetasConocidas , Usuario unUsuario)
	{
		return recetasConocidas.filter[ condicionesInadecuadas.contains( unUsuario.getClass().getName() ) ].toList()			
	}
}