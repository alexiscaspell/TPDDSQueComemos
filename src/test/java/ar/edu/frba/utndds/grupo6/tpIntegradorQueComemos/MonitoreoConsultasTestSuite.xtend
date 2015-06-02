package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.text.DateFormat
import java.util.Date
import java.text.SimpleDateFormat
import java.util.HashMap
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import java.util.ArrayList
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import java.util.List
import queComemos.entrega3.dominio.Dificultad

class MonitoreoConsultasTestSuite {
	
	private DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	private Date fecha = format.parse("01-04-1970")
	private Usuario usuarioFemenino = getUsuarioFemenino();
	private Usuario usuarioMasculino = getUsuarioMasculino();
	private Recetario recetario
	
	def void unaConsulta(){
		recetario.agregar( getLechon() )
		// Agrego las recetas por las que se va a consultar
		recetario.agregar( getPure )
		recetario.agregar( getTorta )
		recetario.agregar( getLechon )
		
		usuarioFemenino.getRecetasConAcceso()
		usuarioMasculino.getRecetasConAcceso()
		
		
	}
	
	def getUsuarioMasculino() {
		val pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		// Agregar Recetas que conoce
		pepe.agregarReceta( getPure )
		// Agregar Observadores
		pepe.addObservador( new ConsultasXSexo() )
		pepe.addObservador( new ConsultasXRecetas() )
		pepe.addObservador( new ConsultasXVeganos() )
		pepe.addObservador( new ConsultasXHora() )
		return pepe
	}
	
	def getUsuarioFemenino(){
		val mariana = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Mariana Lopez",Sexo.FEMENINO,fecha)
		val vegano = new UsuarioVegano( mariana )
		// Agregar Recetas que conoce
		vegano.agregarReceta( getTorta )
		vegano.addObservador( new ConsultasXSexo() )
		vegano.addObservador( new ConsultasXRecetas() )
		vegano.addObservador( new ConsultasXVeganos() )
		vegano.addObservador( new ConsultasXHora() )
		
		return vegano
	}
	
	def Receta getPure()
	{		
		val nombre = "Pure"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.PAPA, 200)
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
		val recetaSimple = new Receta( usuarioMasculino, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple.calorias=100
		recetaSimple
	}
	
		def Receta getTorta()
	{		
		val nombre = "Torta"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.PAPA, 200)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.SAL, 10)
		condimentos.put(Condimento.ACEITE, 10)
		condimentos.put(Condimento.AZUCAR, 350)
		val explicacion = "1 - Pelar las papas\n" + 
						  "2 - Hervir las papas 20 minutos" +
						  "3 - Pisar las papas con un pisapapas" +
						  "4 - Condimentar"
		val temporadas = new ArrayList<Temporada>()		
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)						  
		val recetaSimple = new Receta(usuarioFemenino, nombre, ingredientes, condimentos, explicacion, Dificultad.DIFICIL, temporadas)
		recetaSimple.calorias=600
		recetaSimple
	}
	
	def Receta getLechon()
	{		
		val nombre = "Lechon"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.PAPA, 200)
		ingredientes.put(Ingrediente.LECHON, 100)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.SAL, 10)
		condimentos.put(Condimento.ACEITE, 10)
		val explicacion = "1 - Pelar las papas\n" + 
						  "2 - Hervir las papas 20 minutos" +
						  "3 - Pisar las papas con un pisapapas" +
						  "4 - Condimentar"
		val temporadas = new ArrayList<Temporada>()		
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)						  
		val recetaSimple = new Receta(usuarioFemenino, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple.calorias=150
		recetaSimple
	}
	
	
	
	
	
	
	
}