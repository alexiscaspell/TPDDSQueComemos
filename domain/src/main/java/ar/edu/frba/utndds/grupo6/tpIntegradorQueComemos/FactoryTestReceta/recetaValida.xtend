package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta
import java.util.HashMap
import java.util.ArrayList
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import queComemos.entrega3.dominio.Dificultad
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.TipoReceta

class recetaValida implements recetaFactory {
	
	override Receta noCumple(Usuario usuario)
{

		val nombre = "RecetaVacia"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		val condimentos = new HashMap<Condimento, Integer>()
		val explicacion = "1 - Nada\n" + 
			            "2 - Nada otra vez"
		val temporadas = new ArrayList<Temporada>()		
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)						  
		val recetaSimple = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.DIFICIL, temporadas)
		recetaSimple.tipo= TipoReceta.PUBLICA
		recetaSimple	
	
}

override Receta cumple(Usuario usuario)
{
	var rec= new recetaConSal()
	rec.cumple(usuario)
}
	
}