package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta
import java.util.HashMap
import java.util.ArrayList
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import queComemos.entrega3.dominio.Dificultad

class recetaPublica implements recetaFactory {
	//atributo "publica"
	override Receta cumple(Usuario usuario)
	{
		
	}
	
	override Receta noCumple(Usuario usuario)
	{
		
	}
}