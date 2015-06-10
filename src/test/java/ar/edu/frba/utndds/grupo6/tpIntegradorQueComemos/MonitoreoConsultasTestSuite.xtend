package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import org.junit.Assert
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
import queComemos.entrega3.dominio.Dificultad
import java.util.Calendar

class MonitoreoConsultasTestSuite {
	
	private DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	private Date fecha = format.parse("01-04-1970")
	private Calendar calendario = Calendar.getInstance();
	private Recetario  recetario =  Recetario .getInstance()
	
	// Observadores
	private ConsultasXSexo ConsultasXSexo =  new ConsultasXSexo()
	private ConsultasXRecetas ConsultasXRecetas =  new ConsultasXRecetas()
	private ConsultasXVeganos ConsultasXVeganos =  new ConsultasXVeganos()
	private ConsultasXHora ConsultasXHora =  new ConsultasXHora()
	
	// Usuarios
	private Usuario usuarioFemenino = getUsuarioFemenino();
	private Usuario usuarioMasculino = getUsuarioMasculino();		
	
	@Test
	def void CantidadDeConsultasTest(){
		Recetario.getInstance().reset();
		// Seteo del resetario para pruebas
		seteoRecetario()
			
		usuarioFemenino.getRecetasConAcceso()
		usuarioMasculino.getRecetasConAcceso()
						
		Assert.assertTrue(  ConsultasXRecetas.getEstadistica().get("Lechon") == 2 )
		Assert.assertTrue(  ConsultasXRecetas.getEstadistica().get("Torta") == 1 )
		Assert.assertTrue(  ConsultasXRecetas.getEstadistica().get("Pure") == 1 )
		Assert.assertTrue(  ConsultasXHora.getEstadistica.get(calendario.get( Calendar.HOUR_OF_DAY )) == 2 )
		
		//ConsultasXRecetas.reset()
		
		recetario.reset()
		}
		
		
	@Test 
	def void CantidadDeConsultasXSexoTest(){
		Recetario.getInstance().reset();
		// Seteo del resetario para pruebas
		seteoRecetario()
			
		usuarioFemenino.getRecetasConAcceso()
		usuarioMasculino.getRecetasConAcceso()
		
		
		
		Assert.assertTrue(  ConsultasXSexo.getEstadisticaFemenino().get("Lechon") == 1 )
		Assert.assertTrue(  ConsultasXSexo.getEstadisticaFemenino().get("Torta") == 1 )
		Assert.assertTrue(  ConsultasXSexo.getEstadisticaMasculino().get("Pure") == 1 )
		Assert.assertTrue(  ConsultasXSexo.getEstadisticaMasculino().get("Lechon") == 1 )
		
		//ConsultasXSexo.reset()
		recetario.reset()
	}
	
	@Test
	def void CantiadDeConsultasXHora(){
		Recetario.getInstance().reset();
		seteoRecetario()
	
		usuarioFemenino.getRecetasConAcceso()
		usuarioMasculino.getRecetasConAcceso()	
		
		Assert.assertTrue(  ConsultasXHora.getEstadistica.get(calendario.get( Calendar.HOUR_OF_DAY )) == 2 )
		
		//ConsultasXHora.reset()
		recetario.reset()
	}
	
	@Test
	def void CantidadDeConsultasXVeganos(){
		Recetario.getInstance().reset();
		seteoRecetario()
		
		usuarioFemenino.getRecetasConAcceso()
		usuarioMasculino.getRecetasConAcceso()	
		
		Assert.assertTrue( ConsultasXVeganos.getEstadistica == 1 )
		//ConsultasXVeganos.reset()
		recetario.reset()
		 
	}
		
	
	def seteoRecetario(){
		recetario.agregar( getPure )
		recetario.agregar( getTorta )
		recetario.agregar( getLechon )
	}
	
	def getUsuarioMasculino() {
		val pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		// Agregar Recetas que conoce
		pepe.agregarReceta( getPure )
		// Agregar Observadores
		pepe.addObservador(  ConsultasXSexo )
		pepe.addObservador(  ConsultasXRecetas )
		pepe.addObservador(  ConsultasXVeganos )
		pepe.addObservador(  ConsultasXHora )
		return pepe
	}
	
	def getUsuarioFemenino(){
		val mariana = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Mariana Lopez",Sexo.FEMENINO,fecha)
	
		// Agregar Recetas que conoce
		mariana.agregarReceta( getTorta )
		val vegano = new UsuarioVegano( mariana )
		vegano.addObservador(  ConsultasXSexo )
		vegano.addObservador(  ConsultasXRecetas )
		vegano.addObservador(  ConsultasXHora )
		vegano.addObservador(  ConsultasXVeganos )
			
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
		recetaSimple.setPublica()
		recetaSimple.calorias=150
		recetaSimple
	}
	
	
	
	
	
	
	
}