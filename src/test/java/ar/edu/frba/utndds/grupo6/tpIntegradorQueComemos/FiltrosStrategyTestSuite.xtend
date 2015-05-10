package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import java.text.SimpleDateFormat
import java.text.DateFormat
import java.util.Date
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.util.ArrayList

class FiltroStrategyTestSuite {

	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	Date fecha = format.parse("01-04-1970")
	
	@Test
	def void FiltroStrategyDisgusta() {
		val FiltroDisgusta = new FiltroPostaS()
		FiltroDisgusta.agregarFiltroNoLeGusta()
		FiltroDisgusta.aplicarFiltro( getUsuario.recetasConocidas, getUsuario )
			
	}
	
	def getUsuario(){
		val pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		val platosQueNoLeGustan = new ArrayList<String>()
		platosQueNoLeGustan.add("CARNE")
		platosQueNoLeGustan.add("CHORI")
		pepe.platosQueNoLeGustan = platosQueNoLeGustan
		// Agregar Recetas que conoce
		return pepe 					
	}
	
	}


