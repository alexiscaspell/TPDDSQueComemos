package Web

import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import AplicationModel.PedidoLogin
import AplicationModel.PedidoRecetas

import static AplicationModel.Dependencias.*
import javax.servlet.http.HttpServletRequest

@Controller
class MainController {

	Receta recetaSeleccionada;
	extension JSONUtils jsonUtils = new JSONUtils	
	//UsuarioPosta usuario = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "martin" , Sexo.MASCULINO)		
	
	
	@Post("/login")
	def Result login( @Body String body ){
		var PedidoLogin pedido = body.fromJson(PedidoLogin)
		println("[@Post login()] Haciendo login con nombre: " + pedido.nombre)
		
		usuario_aux = repoUsuarios.getUsuario( pedido.nombre )
		hardcodear(  )
		// Buscar usuario con nombre == pedido.nombre
		// verificar que pedido.pass == usuario encontrado pass
		// setear usuario = usuario encontrado ( sacar el usuario hardcodeado )
		ok
	}
	
	
	def obtenerJugador(HttpServletRequest request) { 
		repoUsuarios.getUsuario( getCookie( request, "usuario") )
	}
	
	def getCookie(HttpServletRequest request, String string) {
		
		println( "[MainController getCookie()] encontrada es = " + request.cookies.findFirst[it.name == string].value)
		request.cookies.findFirst[it.name == string].value
		// Para hacer funcionar, comentar lo de arriba y descomentar lo de abajo
		//"Lucas"	
	}
	
	@Post("/setRecetaSeleccionada")
	def Result setRecetaSeleccionada( @Body String body ){
		recetaSeleccionada = body.fromJson( Receta )
		ok
	}
	
	
	@Get("/usuario")
	def Result usuario(){
		response.contentType = ContentType.APPLICATION_JSON
		ok(  usuario_aux.toJson )	
	}
	
	@Get("/recetas")
	def Result recetas() {
		response.contentType = ContentType.APPLICATION_JSON
		//var usuario = obtenerJugador(request)
		var recetas = new PedidoRecetas( usuario_aux  )
		recetas.setRecetas()
		ok( recetas.toJson )
	}
	
	
	
	@Get("/getRecetaSeleccionada")
	def Result getRecetaSeleccionada(){
		ok( recetaSeleccionada.toJson )	
	}
	
	
	
}