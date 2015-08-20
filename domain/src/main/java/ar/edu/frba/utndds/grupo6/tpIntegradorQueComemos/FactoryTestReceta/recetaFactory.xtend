package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta

interface recetaFactory {
	
	def Receta cumple(Usuario usuario)
	
	def Receta noCumple(Usuario usuario)
}