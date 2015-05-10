package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List
import java.util.ArrayList

public interface FiltroInterfazD {
	
	def List<Receta> aplicarFiltro(List<Receta> recetasConocidas, Usuario unUsuario)
	
}