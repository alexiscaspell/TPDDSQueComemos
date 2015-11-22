package Web

import AplicationModel.UsuarioAdapterJson
import Pedidos.PedidoFiltroConsultaReceta
import Pedidos.PedidoLogin
import Pedidos.PedidoMonitoreo
import Pedidos.PedidoRecetas
import Pedidos.PedidoUsuario
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import com.google.gson.GsonBuilder
import javax.servlet.http.HttpServletRequest
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils

import static AplicationModel.Dependencias.*

@Controller
class MainController {

	Receta recetaSeleccionada;
	extension JSONUtils jsonUtils = new JSONUtils

	//UsuarioPosta usuario = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "martin" , Sexo.MASCULINO)		
	@Post("/login")
	def Result login(@Body String body) {
		val PedidoLogin pedido = body.fromJson(PedidoLogin)
		usuario = usuariosRepository.searchByNickYPass(pedido.nombre, pedido.pass)
		usuario.addObservador(consultasXRecetas)
		// Deberia actualizar el usuario para que tenga el observer ? 
		ok
	}

	def obtenerJugador(HttpServletRequest request) {
		usuariosRepository.findByName(getCookie(request, "usuario"))
	}

	def getCookie(HttpServletRequest request, String string) {
		request.cookies.findFirst[it.name == string].value
	}
	
	def updateUsuario(){
		usuariosRepository.update(usuario)
	}
	
	def updateReceta( Receta receta ){
		recetasRepository.update( receta )
		usuariosRepository.updateRecetasContenidas( usuario, receta )
	}
	
	
	

	@Get("/readonly")
	def Result reaonly() {
		ok(recetaSeleccionada.puedeModificar(usuario).toJson);
	}

	@Post("/setRecetaSeleccionada")
	def Result setRecetaSeleccionada(@Body String body) {
		var gsonBilder = new GsonBuilder();
		gsonBilder.registerTypeAdapter(Usuario, new UsuarioAdapterJson());
		var gson = gsonBilder.create();
		recetaSeleccionada = gson.fromJson(body, Receta)
		ok
	}

	@Post("/nuevoCondimento")
	def Result nuevoCondimento(@Body String nombre) {
		recetaSeleccionada.agregarCondimento(Condimento.valueOf(nombre), 0);
		//---------- Updates ------------- 
		updateReceta( recetaSeleccionada )
		updateUsuario()
		// -------------------------------
		var gsonBilder = new GsonBuilder();
		gsonBilder.registerTypeAdapter(Usuario, new UsuarioAdapterJson());
		var gson = gsonBilder.create();
		ok(gson.toJson(recetaSeleccionada));
	}

	@Post("/nuevoIngrediente")
	def Result nuevoIngrediente(@Body String nombre) {
		recetaSeleccionada.agregarIngrediente(Ingrediente.valueOf(nombre), 0);
		//---------- Updates ------------- 
		updateReceta( recetaSeleccionada )
		updateUsuario()
		// -------------------------------
		
		ok();
	}

	@Post("/actualizarReceta")
	def Result actualizarReceta(@Body String nombre) {
		usuario.modificarReceta(recetaSeleccionada.nombre, recetaSeleccionada.nombre,
			recetaSeleccionada.ingredientes, recetaSeleccionada.condimentos, recetaSeleccionada.explicacion,
			recetaSeleccionada.dificultad, recetaSeleccionada.temporadas);
		//---------- Updates ------------- 
		updateReceta( recetaSeleccionada )
		updateUsuario()
		// -------------------------------
		
		ok
	}

	@Post("/ConsultarReceta")
	def Result consultar(@Body String body) {
		var gsonBilder = new GsonBuilder();
		gsonBilder.registerTypeAdapter(Usuario, new UsuarioAdapterJson());
		var gson = gsonBilder.create();
		recetaSeleccionada = gson.fromJson(body, Receta)
		usuario.consultarPorReceta(recetaSeleccionada)
		//---------- Updates ------------- 
		updateReceta( recetaSeleccionada )
		updateUsuario()
		// -------------------------------
		
		ok
	}

	@Get("/getCondicionesPreexistentes")
	def Result getCondicionesPreexistentes() {
		ok(recetaSeleccionada.condicionesInadecuadas().toJson)
	}

	@Get("/usuario")
	def Result usuario() {
		response.contentType = ContentType.APPLICATION_JSON
		var pedidoUsuario = new PedidoUsuario(usuario)
		pedidoUsuario.Color()
		ok(pedidoUsuario.toJson)
	}

	@Get("/recetas")
	def Result recetas() {
		response.contentType = ContentType.APPLICATION_JSON
		var gsonBilder = new GsonBuilder();
		gsonBilder.registerTypeAdapter(Usuario, new UsuarioAdapterJson());
		var gson = gsonBilder.create();
		var recetas = new PedidoRecetas(usuario)
		recetas.setRecetas()
		ok(gson.toJson(recetas))
	}

	@Get("/monitoreo")
	def Result monitoreo() {
		response.contentType = ContentType.APPLICATION_JSON
		var monitoreo = new PedidoMonitoreo()
		monitoreo.masConsultadas()
		ok(monitoreo.toJson)
	}

	@Get("/getRecetaSeleccionada")
	def Result getRecetaSeleccionada() {
		ok(recetaSeleccionada.toJson)
	}

	@Post("/setFiltros")
	def Result setFiltros(@Body String body) {
		var PedidoFiltroConsultaReceta pedido = body.fromJson(PedidoFiltroConsultaReceta)
		println("[@Post setFiltros()] Recibiendo filtros con nombre: " + pedido.nombre)
		println("[@Post setFiltros()] Recibiendo filtros con dificultad: " + pedido.dificultad)
		println("[@Post setFiltros()] Recibiendo filtros con ingrediente: " + pedido.ingrediente)
		println("[@Post setFiltros()] Recibiendo filtros con minimoCalorias: " + pedido.minimoCalorias)
		println("y maximoCalorias: " + pedido.maximoCalorias)
		println("[@Post setFiltros()] Recibiendo filtros con temporada: " + pedido.temporada)
		println("[@Post setFiltros()] Recibiendo filtros con filtrosUsuario: " + pedido.filtrosUsuario)

		if (pedido.filtrosUsuario == null)
			pedido.filtrosUsuario = false

		filtrador.usuario = usuario
		filtrador.crearFiltros(pedido)

		var listaFiltrada = filtrador.filtrar(recetasRepository.allInstances) //consultar si hacerlo EAGER o LAZY

		ok(listaFiltrada.toJson)
	}

	@Get("/getEnums")
	def Result getEnums() {
		enumsSistema.hardcodear()
		ok(enumsSistema.toJson)
	}

}
