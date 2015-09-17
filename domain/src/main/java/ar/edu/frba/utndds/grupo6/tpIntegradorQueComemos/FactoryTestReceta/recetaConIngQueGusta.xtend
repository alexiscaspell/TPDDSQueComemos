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

class recetaConIngQueGusta implements recetaFactory {
	override Receta cumple(Usuario usuario) {
		var rec = new recetaConCarne()
		rec.cumple(usuario)
	}

	override Receta noCumple(Usuario usuario) //La remolacha no le gusta a nadie//
	{
		val nombre = "Remolacha con huevo"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.REMOLACHA, 1000)
		ingredientes.put(Ingrediente.HUEVO, 6)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.SAL, 10)
		condimentos.put(Condimento.ACEITE, 10)
		val explicacion = "1 - Cortar la remolacha\n" + "2 - Mezclar remolacha con huevo"

		val temporadas = new ArrayList<Temporada>()
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)
		val recetaSimple = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL,
			temporadas)
		recetaSimple.tipo = TipoReceta.PUBLICA
		recetaSimple

	}

}
