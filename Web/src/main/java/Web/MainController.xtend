package Web

import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.Result
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import java.util.ArrayList
import com.google.gson.Gson
import AplicationModel.UsuarioTestBuilder
import AplicationModel.PanelHomeAP
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ConsultasXRecetas

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConAzucar
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConCarne
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConAzucar
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo

//
@Controller
class MainController {

	extension JSONUtils jsonUtils = new JSONUtils	
	//Observadores
	
	/*
	private ConsultasXRecetas ConsultasXRecetas = new ConsultasXRecetas()
	
	var UsuarioTestBuilder = new UsuarioTestBuilder()
	var panelHomeAP = new PanelHomeAP(ConsultasXRecetas.estadistica)
	
	recetaConAzucar recetaAzucar = new recetaConAzucar()
	recetaConCarne recetaCarne = new recetaConCarne()
	val usuario_test = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO)
	*/	
	
	def static void main(String[] args) {
		XTRest.start(MainController, 9000)
	}
	
	@Get("/recetas")
	def Result libros() {
		//val lista = panelHomeAP.resultadosRecetas( UsuarioTestBuilder.usuarioBuilder() ))
		
		val recetas = new ArrayList<Receta>();
		//recetas.add( recetaAzucar.cumple(usuario_test) )
		//recetas.add( recetaAzucar.noCumple(usuario_test) )

    	
    	
    	val receta1 = new Receta();
    	receta1.nombre = "Receta 1";
    	receta1.anio = 2015;
    	
    	val receta2 = new Receta();
    	receta2.nombre = "Receta 2";
    	receta2.anio = 2014;
    	
    	recetas.add(receta1);
    	recetas.add(receta2);

		response.contentType = ContentType.APPLICATION_JSON			
						
		ok( recetas.toJson )
	}
}