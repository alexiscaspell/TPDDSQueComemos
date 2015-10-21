package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta

interface recetaFactory {

	def Receta cumple(String creador)

	def Receta noCumple(String creador)
}
