package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Command
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.RecetaAdapter
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ResultadoConsulta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import com.google.gson.Gson
import com.google.gson.JsonArray
import com.google.gson.JsonParser
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import queComemos.entrega3.repositorio.BusquedaRecetas
import queComemos.entrega3.repositorio.RepoRecetas

public class RecetasRepository extends MongoDBRepository<Receta> {

	private RepoRecetas repoRecetas = new RepoRecetas();

	private Gson gson = new Gson();

	private RecetaAdapter adapter = new RecetaAdapter();

	@Accessors
	private Command sendMailCommand;

	new() {
		super("Receta")
	}

	override getEntityType() {
		typeof(Receta)
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

		//		if (el perfil del usuario tiene marcado el check de marcar todas las recetas como favoritas)
		//		{
		//			Ejecutar Comando de Marcar Favoritas
		//		}
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
		recetasAdaptadas.toList() as ArrayList<Receta>;
	}

	def Receta getReceta(String string) {
		findByName(string)
	}
}
