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
import java.util.HashSet

class recetaPublica implements recetaFactory {

	//atributo "publica"
	override Receta cumple(String creador) {
		val nombre = "Torta"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.HARINA, 1000)
		ingredientes.put(Ingrediente.HUEVO, 3)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.AZUCAR, 100)
		condimentos.put(Condimento.ACEITE, 10)
		val explicacion = "No se hacer una torta"
		val temporadas = new HashSet<Temporada>()
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)
		val recetaSimple = new Receta(creador, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL,
			temporadas)
		recetaSimple.tipo = TipoReceta.PUBLICA
		recetaSimple

	}

	override Receta noCumple(String creador) {
		val nombre = "Torta"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.HARINA, 1000)
		ingredientes.put(Ingrediente.HUEVO, 3)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.AZUCAR, 100)
		condimentos.put(Condimento.ACEITE, 10)
		val explicacion = "No se hacer una torta"
		val temporadas = new HashSet<Temporada>()
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)
		val recetaSimple = new Receta(creador, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL,
			temporadas)
		recetaSimple.tipo = TipoReceta.PRIVADA
		recetaSimple

	}
}
