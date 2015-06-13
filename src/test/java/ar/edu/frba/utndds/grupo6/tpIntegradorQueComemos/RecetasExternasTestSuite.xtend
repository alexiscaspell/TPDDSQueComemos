package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import queComemos.entrega3.repositorio.RepoRecetas
import queComemos.entrega3.repositorio.BusquedaRecetas
import com.google.gson.Gson
import com.google.gson.JsonParser
import java.util.ArrayList
import com.google.gson.JsonArray
import org.junit.Assert
import org.junit.Before

public class RecetasExternasTestSuite {
	
	private RepoRecetas repo;
	private Gson gson;
	private RecetaAdapter adapter;
	
	@Before
	def void SetUp()
	{
		repo = new RepoRecetas();
		gson = new Gson();
		adapter = new RecetaAdapter();
		Recetario.getInstance().reset();
	}
	
	//El RepoRecetas devuelve 12 Recetas en forma JSON	
	@Test
	def void ObtencionDeTodasLasRecetas()
	{		
		val recetas = repo.getRecetas(new BusquedaRecetas());
		
		val listRecetas = new ArrayList<queComemos.entrega3.dominio.Receta>();
		
		(new JsonParser().parse(recetas) as JsonArray).forEach[x | 
			val recetaGson = gson.fromJson(x, queComemos.entrega3.dominio.Receta);
			listRecetas.add(recetaGson);	
		]
		
		listRecetas.forEach[x |
			println(x.nombre)
			x.ingredientes.forEach[y|
				println("    " + y);
			]
		]
		
		Assert.assertEquals(listRecetas.size, 12);		
	}
	
	@Test
	def void ConversionDeRecetasConAdapter()
	{
		val recetas = repo.getRecetas(new BusquedaRecetas());
		
		val listRecetas = new ArrayList<queComemos.entrega3.dominio.Receta>();
		
		(new JsonParser().parse(recetas) as JsonArray).forEach[x | 
			val recetaGson = gson.fromJson(x, queComemos.entrega3.dominio.Receta);
			listRecetas.add(recetaGson);]
		
		val recetasAdaptadas = new ArrayList<Receta>();
		
		listRecetas.forEach[x|
			recetasAdaptadas.add(adapter.getReceta(x));
		]
		
		Assert.assertEquals(listRecetas.size, recetasAdaptadas.size);
	}
	
	@Test
	def void ObtencionDeRecetasExternasDelRecetario()
	{
		val recetario = Recetario.getInstance();
		
		val recetasExternas = recetario.getRecetasExternas();
		
		Assert.assertEquals(recetasExternas.size, 12);
	}
}