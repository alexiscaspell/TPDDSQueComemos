package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import java.text.SimpleDateFormat
import java.text.DateFormat
import java.util.Date
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.util.ArrayList
import org.junit.Assert
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import java.util.HashMap
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Dificultad

class FiltroDecoretorTestSuite {
	
	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	Date fecha = format.parse("01-04-1970")
	//Usuario usuario1 = getUsuario1();
	
	
	@Test
	def void FiltroDecoretorDisgusta()
	{
		val FiltroDisgusta = new FiltroNoLeGustaD();
		///val List<Receta>= new
		//Assert.assertTrue(FiltroDisgusta.aplicarFiltro(getUsuario.recetasConocidas, getUsuario),)
		
			
	}
	

	def Receta getRecetaPure()
	{		
		val nombre = "Pure"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.PAPA, 1000)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.SAL, 10)
		condimentos.put(Condimento.ACEITE, 10)
		condimentos.put(Condimento.AZUCAR, 100)
		val explicacion = "1 - Pelar las papas\n" + 
						  "2 - Hervir las papas 20 minutos" +
						  "3 - Pisar las papas con un pisapapas" +
						  "4 - Condimentar"
		val temporadas = new ArrayList<Temporada>()		
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)						  
		val recetaSimple = new Receta(getUsuario(), nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple
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