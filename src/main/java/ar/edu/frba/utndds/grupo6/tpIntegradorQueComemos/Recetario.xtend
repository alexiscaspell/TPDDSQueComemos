package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.List
import queComemos.entrega3.repositorio.RepoRecetas
import queComemos.entrega3.repositorio.BusquedaRecetas
import com.google.gson.JsonElement

class Recetario {
	
	private RepoRecetas repoRecetas = new RepoRecetas();
	
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
		val busqueda = new BusquedaRecetas();
		val recetasExternas = repoRecetas.getRecetas(busqueda);
		val parser = new com.google.gson.JsonParser();
		parser.parse(recetasExternas).asJsonArray.toList().forEach[x | CargarReceta(x)]			
		recetas;
	}
	
	def Receta CargarReceta(JsonElement element) {
		//TODO: Crear una receta segun los campos del elemento JSON
	}

	def getReceta(String nombre) 
	{		
		val recetaEncontrada = recetas.findFirst[x | x.nombre == nombre]
		if (recetaEncontrada != null)
		{
			return recetaEncontrada;
		}
		else
		{
			val busqueda = new BusquedaRecetas();
			busqueda.nombre = nombre;
			val recetasExternas = repoRecetas.getRecetas(busqueda);
			val parser = new com.google.gson.JsonParser();
			CargarReceta(parser.parse(recetasExternas).asJsonArray.toList().findFirst[x | x.asString == nombre]);
		}
	}
	
}
