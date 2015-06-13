package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.List
import queComemos.entrega3.repositorio.RepoRecetas

public class Recetario {
	
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
		recetas.findFirst[x | x.nombre == nombre]
	}
	
	def reset(){
		recetas.clear()
	}
	
}
