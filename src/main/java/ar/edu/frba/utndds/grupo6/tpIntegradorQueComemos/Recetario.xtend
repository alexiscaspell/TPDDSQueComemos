package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList

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

	def getReceta(String nombre) 
	{
		recetas.findFirst[x | x.nombre == nombre]
	}
}
