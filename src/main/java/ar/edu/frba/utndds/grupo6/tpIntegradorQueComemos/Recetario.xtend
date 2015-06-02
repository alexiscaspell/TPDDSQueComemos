package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.List
import queComemos.entrega3.repositorio.RepoRecetas
import queComemos.entrega3.repositorio.BusquedaRecetas
import org.json.simple.parser.JSONParser
import org.json.simple.JSONObject

public class Recetario {
	
	private JSONParser parser = new JSONParser();
	
	private RepoRecetas repoRecetas = new RepoRecetas();
	
	private ArrayList<Receta> recetas;
	
	private static Recetario instance;
	
	static def Recetario getInstance()
	{
		if (instance == null)
		{
			instance = new Recetario()
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
		/*val busqueda = new BusquedaRecetas();
		val recetasExternas = repoRecetas.getRecetas(busqueda);
		val json = parser.parse(recetasExternas) as JSONArray;
		json.forEach[receta | recetas.add(CargarReceta(receta as JSONObject))]*/		
		recetas;
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
			val json = parser.parse(recetasExternas) as JSONObject;
			CargarReceta(json);
		}
	}
	
	def Receta CargarReceta(JSONObject object) {
		//TODO: Crear una receta segun los campos del elemento JSON
		/*String name = (String) jsonObject.get("Name");
            String author = (String) jsonObject.get("Author"); */
	}
	
}
