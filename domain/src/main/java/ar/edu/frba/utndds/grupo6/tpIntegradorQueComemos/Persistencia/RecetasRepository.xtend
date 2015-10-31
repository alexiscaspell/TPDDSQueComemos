package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import org.hibernate.Criteria
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

class RecetasRepository extends RepoDefault<Receta> {

	private static RecetasRepository instance

	private RepoRecetas repoRecetas = new RepoRecetas();

	private Gson gson = new Gson();

	private RecetaAdapter adapter = new RecetaAdapter();

	@Accessors
	private Command sendMailCommand;

	static def getInstance() {
		if (instance == null) {
			instance = new RecetasRepository()
		}
		return instance
	}

	override getEntityType() {
		typeof(Receta)
	}

	override addQueryByExample(Criteria criteria, Receta t) {
		// Sobre que criteria se busca, habria un solo tipo de busqueda?
	}

	// Modificar?
	def ResultadoConsulta getRecetasQueCumplen(Usuario usuario, Receta receta) {
		val recetasQueCoinciden = allInstances.filter [ x |
			x.puedeVer(usuario) && receta.nombre == null || receta.nombre.equals(x.nombre) && receta.anio == 0 || receta.
				anio == x.anio && receta.dificultad == null || receta.dificultad == x.dificultad &&
				receta.explicacion == null || receta.explicacion.equals(x.explicacion)
		].toList();

		val resultado = new ResultadoConsulta(receta, recetasQueCoinciden, usuario)

		sendMailCommand.execute(resultado);

		if (recetasQueCoinciden.size > 100) {
			//TODO: Ejecutar comando de Log
		}

		//if (el perfil del usuario tiene marcado el check de marcar todas las recetas como favoritas)
		//{
		//	Ejecutar Comando de Marcar Favoritas
		//}
		return resultado;
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

		recetasAdaptadas.filter[x|!allInstances.contains(x)].toList() as ArrayList<Receta>;
	}
	
	def List<Receta> getRecetas(){
		
		allInstances
	}

}
