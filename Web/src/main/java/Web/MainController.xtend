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
import java.util.ArrayList

// Aplication Model
import AplicationModel.ListadoRecetas


@Controller
class MainController {

	Receta recetaSeleccionada;
		
	extension JSONUtils jsonUtils = new JSONUtils	
		
	
	def static void main(String[] args) {
		XTRest.start(MainController, 9000)
	}
	
	@Post("/setRecetaSeleccionada")
	def Result setRecetaSeleccionada( @Body String body ){
		recetaSeleccionada = body.fromJson( Receta )
		ok
	}
	
	@Get("/recetas")
	def Result recetas() {
		

		val recetas = new ArrayList<Receta>();
		 		    	
    	val receta1 = new Receta();
    	receta1.nombre = "Receta 1";
    	receta1.anio = 2015;
    	
    	val receta2 = new Receta();
    	receta2.nombre = "Receta 2";
    	receta2.anio = 2014;
    	
    	recetas.add(receta1);
    	recetas.add(receta2);
 		 
		response.contentType = ContentType.APPLICATION_JSON			
						
		//ok( ( new ListadoRecetas() ).toJson )
		ok( recetas.toJson )
	}
	
	
	
	@Get("/getRecetaSeleccionada")
	def Result getRecetaSeleccionada(){
		ok( recetaSeleccionada.toJson )	
	}
	
}