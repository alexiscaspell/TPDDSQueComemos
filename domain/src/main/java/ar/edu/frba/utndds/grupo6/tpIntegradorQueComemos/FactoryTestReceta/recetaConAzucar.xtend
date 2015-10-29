package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.TipoReceta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import java.util.ArrayList
import java.util.HashMap
import queComemos.entrega3.dominio.Dificultad
import java.util.HashSet

@Data
class recetaConAzucar implements recetaFactory {

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
		val recetaSimple = new Receta( creador, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL,
			temporadas)
		recetaSimple.tipo = TipoReceta.PRIVADA
		recetaSimple.calorias = 600
		recetaSimple

	}

	override Receta noCumple(String creador ) {
		val nombre = "Pan casero"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.HARINA, 1000)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.SAL, 400)
		condimentos.put(Condimento.LEVADURA, 500) //AGREGAR LEVADURA A INGREDIENTE.
		val explicacion = "1 - Mezclar la harina con la sal\n" /*+
			"2 - Disolver la levadura en agua e ir agregando da a poco a la harina" +
			"3 - Amasar y dejar fermentando durante dos horas aprox" 
			 + "4 - Fraccionar la masa y armar los panes, luego al horno por 40 minutos a 200 grados." */
		val temporadas = new HashSet<Temporada>()
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)
		val recetaSimple = new Receta( creador, nombre, ingredientes, condimentos, explicacion, Dificultad.MEDIANA,
			temporadas)
		recetaSimple.tipo = TipoReceta.PUBLICA
		recetaSimple.calorias = 350
		recetaSimple
	}

}
