package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.List
import queComemos.entrega3.repositorio.RepoRecetas
import queComemos.entrega3.repositorio.BusquedaRecetas
import org.json.simple.parser.JSONParser
import org.json.simple.JSONObject
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import org.json.simple.JSONArray
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import java.util.HashMap
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import queComemos.entrega3.dominio.Dificultad

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
	
	def Receta CargarReceta(JSONObject jsonObject) {
		val nombreReceta = jsonObject.get("Nombre") as String;
		
		val nombreUsuario = jsonObject.get("Autor") as String;
		val usuario = new UsuarioPosta(1,1, Rutina.LEVE, nombreUsuario, Sexo.MASCULINO, null);
		
		val ingredientes = jsonObject.get("Ingredientes") as JSONArray;
		val listaIngredientes = new HashMap<Ingrediente, Integer>();
		ingredientes.forEach[x |
			val rowIngrediente = x as JSONArray;
			val ingrediente = rowIngrediente.get(0) as JSONObject;
			listaIngredientes.put(ingrediente.get("Ingrediente") as Ingrediente, ingrediente.get("Cantidad") as Integer);]
		
		val condimentos = jsonObject.get("Condimentos") as JSONArray;
		val listaCondimentos = new HashMap<Condimento, Integer>();
		condimentos.forEach[x |
			val rowCondimento = x as JSONArray;
			val condimento = rowCondimento.get(0) as JSONObject;
			listaCondimentos.put(condimento.get("Condimento") as Condimento, condimento.get("Cantidad") as Integer);]
			
		val explicacion = jsonObject.get("Explicacion") as String;
		
		val dificultadJson = jsonObject.get("Dificultad") as String;
		
		val dificultad = GetDificultad(dificultadJson);
		
		val receta = new Receta(usuario, nombreReceta, listaIngredientes, listaCondimentos, explicacion, dificultad, null)
		receta
	}
	
	def Dificultad GetDificultad(String dif) {
		switch (dif)
		{
			case "D":
			return Dificultad.DIFICIL
			case "M":
			return Dificultad.MEDIANA
			case "F":
			return Dificultad.FACIL
		}
	}
	
	def reset(){
		recetas.clear()
	}
	
}
