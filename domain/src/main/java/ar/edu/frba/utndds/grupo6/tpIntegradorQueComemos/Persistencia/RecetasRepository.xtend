package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ResultadoConsulta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Command
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import queComemos.entrega3.repositorio.BusquedaRecetas
import java.util.ArrayList
import com.google.gson.JsonParser
import com.google.gson.JsonArray
import com.google.gson.Gson
import queComemos.entrega3.repositorio.RepoRecetas
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.RecetaAdapter
import org.bson.Document
import java.util.Map
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import queComemos.entrega3.dominio.Dificultad
import java.util.Set
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada

public class RecetasRepository extends MongoDBRepository<Receta> {

	private RepoRecetas repoRecetas = new RepoRecetas();

	private Gson gson = new Gson();

	private RecetaAdapter adapter = new RecetaAdapter();

	@Accessors
	private Command sendMailCommand;

	new(String className) {
		super(className)
	}

	override getEntityType() {
		typeof(Receta)
	}

	// Modificar?
	def ResultadoConsulta getRecetasQueCumplen(Usuario usuario, Receta receta) {
		//		val recetasQueCoinciden = allInstances.filter [ x |
		//			x.puedeVer(usuario) && receta.nombre == null || receta.nombre.equals(x.nombre) && receta.anio == 0 || receta.
		//				anio == x.anio && receta.dificultad == null || receta.dificultad == x.dificultad &&
		//				receta.explicacion == null || receta.explicacion.equals(x.explicacion)
		//		].toList();
		//		val resultado = new ResultadoConsulta(receta, recetasQueCoinciden, usuario)
		//		sendMailCommand.execute(resultado);
		//		if (recetasQueCoinciden.size > 100) {
		//			//TODO: Ejecutar comando de Log
		//		}
		//if (el perfil del usuario tiene marcado el check de marcar todas las recetas como favoritas)
		//{
		//	Ejecutar Comando de Marcar Favoritas
		//}
		//		return resultado;
	}

	// Modificar?	
	def List<Receta> getRecetasExternas() {
		val recetasJson = repoRecetas.getRecetas(new BusquedaRecetas());

		val listRecetasExternas = new ArrayList<queComemos.entrega3.dominio.Receta>();

		(new JsonParser().parse(recetasJson) as JsonArray).forEach[x|
			val recetaGson = gson.fromJson(x, queComemos.entrega3.dominio.Receta);
			listRecetasExternas.add(recetaGson);]

		val recetasAdaptadas = new ArrayList<Receta>();

		listRecetasExternas.forEach [ x |
			recetasAdaptadas.add(adapter.getReceta(x));
		]

		//		recetasAdaptadas.filter[x|!allInstances.contains(x)].toList() as ArrayList<Receta>;
		recetasAdaptadas.toList() as ArrayList<Receta>;
	}
	
	/* LO MISMO Q EN USUARIO; FIND BY NAME DEBERIA DEVOLVER UN DOCUMENTO
	def Receta getReceta(String string) {
		RecetaFromJson( findByName( string ).head )	
	}
	 */
	
	// No seria necesario porque las operaciones sobre collection ya saben que devolver ? 
	def Receta RecetaFromJson( Document recetaJSON ){
		new Receta(
			recetaJSON.get("usuario") as String, 
			recetaJSON.get("nombre") as String,
			recetaJSON.get("ingredientes") as Map<Ingrediente, Integer>,
			recetaJSON.get("condimentos") as Map<Condimento, Integer>,
			recetaJSON.get("explicacion") as String,
			recetaJSON.get("dificultad") as Dificultad,
			recetaJSON.get("temporadas") as Set<Temporada>
		)
	}
	
}
