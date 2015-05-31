package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.List

class RepositorioRecetas {
	
	private ArrayList<Receta> recetas;
	
	private static RepositorioRecetas instance;
	
	static def RepositorioRecetas getInstance()
	{
		if (instance == null)
		{
			new RepositorioRecetas()
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
	
	def agregar(Receta receta)
	{
		recetas.add(receta)
	}
	
	def quitar(Receta receta)
	{
		recetas.remove(receta)
	}
	
	def List<Receta> listarTodas()
	{
		recetas;
	}

	def getReceta(String nombre) 
	{
		recetas.findFirst[x | x.nombre == nombre]
	}
	
}
