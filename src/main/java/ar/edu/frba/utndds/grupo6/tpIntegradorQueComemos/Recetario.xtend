package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.List
import queComemos.entrega3.repositorio.RepoRecetas
import queComemos.entrega3.repositorio.BusquedaRecetas
import com.google.gson.JsonParser
import com.google.gson.JsonArray
import com.google.gson.Gson
import org.eclipse.xtend.lib.annotations.Accessors

public class Recetario {
	
	@Accessors
	private Command sendMailCommand;
	
	private RepoRecetas repoRecetas = new RepoRecetas();
	
	private Gson gson = new Gson();
	
	private RecetaAdapter adapter = new RecetaAdapter();
	
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
		recetas.addAll(getRecetasExternas());
		recetas;
	}

	def getReceta(String nombre) 
	{		
		recetas.findFirst[x | x.nombre == nombre]
	}
	
	def reset(){
		recetas.clear()
	}
	
	def List<Receta> getRecetasExternas()
	{
		val recetasJson = repoRecetas.getRecetas(new BusquedaRecetas());
		
		val listRecetasExternas = new ArrayList<queComemos.entrega3.dominio.Receta>();
		
		(new JsonParser().parse(recetasJson) as JsonArray).forEach[x | 
			val recetaGson = gson.fromJson(x, queComemos.entrega3.dominio.Receta);
			listRecetasExternas.add(recetaGson);]
		
		val recetasAdaptadas = new ArrayList<Receta>();
		
		listRecetasExternas.forEach[x|
			recetasAdaptadas.add(adapter.getReceta(x));
		]
		
		recetasAdaptadas.filter[x| !recetas.contains(x)].toList() as ArrayList<Receta>;
	}
	
	def ResultadoConsulta getRecetasQueCumplen(Usuario usuario, Receta receta)
	{
		val recetasQueCoinciden = recetas.filter[x | x.puedeVer(usuario) && 
			receta.nombre == null || receta.nombre.equals(x.nombre) &&
			receta.anio == 0 || receta.anio == x.anio &&
			receta.dificultad == null || receta.dificultad == x.dificultad && 
			receta.explicacion == null || receta.explicacion.equals(x.explicacion)
		].toList();
		 
		val resultado = new ResultadoConsulta(receta, recetasQueCoinciden, usuario)
		
		sendMailCommand.execute(resultado);
		
		if (recetasQueCoinciden.size > 100)
		{
			//TODO: Ejecutar comando de Log
		}
		
		//if (el perfil del usuario tiene marcado el check de marcar todas las recetas como favoritas)
		//{
		//	Ejecutar Comando de Marcar Favoritas
		//}
		
		return resultado;
	}
}
