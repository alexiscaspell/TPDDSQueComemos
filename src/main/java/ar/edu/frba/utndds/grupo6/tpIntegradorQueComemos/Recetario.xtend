package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.HashMap

class Recetario {
	
	private ArrayList<Receta> recetas;
	
	private static Recetario instance;
	
	static def Recetario getInstance()
	{
		if (instance == null)
		{
			new Recetario()
		}
		else
		{
			instance
		}
	}
	
	private new()
	{
		recetas = new ArrayList<Receta>()
	}
	
	def agregarReceta(Receta receta)
	{
		recetas.add(receta)
	}	

	def agregarRecetaSimple(String nombre, HashMap<Ingrediente, Integer> ingredientes,
		HashMap<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad,
		ArrayList<Temporada> temporada) {

		val recetaSimple = new RecetaSimple(null, nombre, ingredientes, condimentos, explicacion, dificultad, temporada)
		// Setear tipo de receta publica 
		recetas.add(recetaSimple)
	}

	def getReceta(String nombre) 
	{
		recetas.findFirst[x | x.nombre == nombre]
		//for (i : 0 ..< recetas.length) {
			//val receta = recetas.get(i)
			//if(receta.nombre == nombre) return receta
		//} 
		// Exception!
	}
}
