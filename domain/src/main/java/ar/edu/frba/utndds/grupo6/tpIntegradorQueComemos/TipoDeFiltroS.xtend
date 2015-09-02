package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List

interface TipoDeFiltroS {
	def List<Receta> aplicarFiltro(List<Receta> recetasConocidas, Usuario usuario)
}
