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

class recetaConIngCaro {

	def Receta cumple(Usuario usuario) {

		val nombre = "Salmon Ahumado"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.SALMON, 1000)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.SAL, 10)
		condimentos.put(Condimento.ACEITE, 10)
		val explicacion = "1 - Ni idea pero el salmon es caro"
		val temporadas = new ArrayList<Temporada>()
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)
		val recetaSimple = new Receta(usuario.nombre, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL,
			temporadas)
		recetaSimple.tipo = TipoReceta.PRIVADA
		recetaSimple

	}

	def Receta noCumple(Usuario usuario) {
		var rec = new recetaConCarne()
		rec.cumple(usuario)
	}

}
