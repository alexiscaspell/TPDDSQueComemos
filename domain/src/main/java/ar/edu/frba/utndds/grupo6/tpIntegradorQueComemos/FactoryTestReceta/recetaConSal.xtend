package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.TipoReceta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import java.util.HashMap
import java.util.HashSet
import queComemos.entrega3.dominio.Dificultad

public class recetaConSal implements recetaFactory {

	override Receta cumple(String creador) {
		val nombre = "Pure"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.PAPA, 1000)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.SAL, 10)
		condimentos.put(Condimento.ACEITE, 10)
		condimentos.put(Condimento.AZUCAR, 100)
		val explicacion = "1 - Pelar las papas\n" + "2 - Hervir las papas 20 minutos"

		// + "3 - Pisar las papas con un pisapapas" + "4 - Condimentar"
		val temporadas = new HashSet<Temporada>()
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)
		val recetaSimple = new Receta(creador, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL,
			temporadas)
		recetaSimple.calorias = 100
		recetaSimple.tipo = TipoReceta.PUBLICA
		recetaSimple
	}

	override Receta noCumple(String creador) {
		val nombre = "Frutillas a la crema"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.FRUTILLA, 1000)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.CREMA, 500)
		condimentos.put(Condimento.AZUCAR, 800)
		val explicacion = "1 - Cortar las frutillas\n"

		/*+ "2 - Preparar crema" + "3 - Agregar azucar a las frutillas" 
			+ "4 - Servir las frutillas junto con la crema" */
		val temporadas = new HashSet<Temporada>()
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)
		val recetaSimple = new Receta(creador, nombre, ingredientes, condimentos, explicacion, Dificultad.MEDIANA,
			temporadas)
		recetaSimple.tipo = TipoReceta.PRIVADA
		recetaSimple.calorias = 240
		recetaSimple
	}
}
