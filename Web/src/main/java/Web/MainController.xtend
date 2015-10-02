package Web


import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import AplicationModel.PedidoLogin
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import AplicationModel.PedidoRecetas


@Controller
class MainController {

	Receta recetaSeleccionada;
	extension JSONUtils jsonUtils = new JSONUtils	
	UsuarioPosta usuario = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "martin" , Sexo.MASCULINO)		
	
	def static void main(String[] args) {
		XTRest.start(MainController, 9000)
	}
	
	@Post("/login")
	def Result login( @Body String body ){
		var PedidoLogin pedido = body.fromJson(PedidoLogin)
		// Buscar usuario con nombre == pedido.nombre
		// verificar que pedido.pass == usuario encontrado pass
		// setear usuario = usuario encontrado ( sacar el usuario hardcodeado )
		ok
	}
	
	/*
	def obtenerJugador(HttpServletRequest request) {
		repoJugadores.encontrarPorNombre(getCookie(request, "usuario"))
	} */
	
	@Post("/setRecetaSeleccionada")
	def Result setRecetaSeleccionada( @Body String body ){
		recetaSeleccionada = body.fromJson( Receta )
		ok
	}
	
	
	@Get("/usuario")
	def Result usuario(){
		response.contentType = ContentType.APPLICATION_JSON
		ok( usuario.toJson )	
	}
	
	@Get("/recetas")
	def Result recetas() {
		response.contentType = ContentType.APPLICATION_JSON
		var recetas = new PedidoRecetas( usuario )
		recetas.setRecetas()
		ok( recetas.toJson )
	}
	
	
	
	@Get("/getRecetaSeleccionada")
	def Result getRecetaSeleccionada(){
		ok( recetaSeleccionada.toJson )	
	}
	
	
	
}