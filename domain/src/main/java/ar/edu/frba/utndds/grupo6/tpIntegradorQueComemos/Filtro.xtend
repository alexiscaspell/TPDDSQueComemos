package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List

abstract class Filtro {

	def List<Receta> aplicarFiltro(List<Receta> recetasConocidas, Usuario unUsuario)

}
