package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List

interface PostCondiciones {

	def List<Receta> aplicarPostCondicion(List<Receta> recetas)
}
