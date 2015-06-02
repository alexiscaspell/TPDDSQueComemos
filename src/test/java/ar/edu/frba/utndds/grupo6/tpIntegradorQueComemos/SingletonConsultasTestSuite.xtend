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

class SingletonConsultasTestSuite {
	
	private DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	private Date fecha = format.parse("01-04-1970")
	private Calendar calendario = Calendar.getInstance();
	private Recetario  recetario =  Recetario .getInstance()
	private Consultoria consultoria = Consultoria.getInstance()
	
	// Usuarios
	private Usuario usuarioFemenino = getUsuarioFemenino();
	private Usuario usuarioMasculino = getUsuarioMasculino();		
	
	@Test
	def void CantidadDeConsultasTest(){
		// Seteo del resetario para pruebas
		println("____Consultas X CANTIDAD____")
		seteoRecetario()
			
		usuarioFemenino.getRecetasConAcceso()
		usuarioMasculino.getRecetasConAcceso()
		
		Assert.assertTrue( consultoria.getRecetasConsultadas().get("Lechon") == 4 ) //CORREGIR! 6?
		Assert.assertTrue( consultoria.getRecetasConsultadas().get("Torta") == 2 ) //CORREGIR! 3?
		Assert.assertTrue( consultoria.getRecetasConsultadas().get("Pure") == 2 ) //CORREGIR! 3?
		
		//ConsultasXRecetas.reset()
		
		recetario.reset()
		}
		
	@Test 
	def void CantidadDeConsultasXSexoTest(){
		// Seteo del resetario para pruebas
		println("____Consultas X SEXO____")
		seteoRecetario()
			
		usuarioFemenino.getRecetasConAcceso()
		usuarioMasculino.getRecetasConAcceso()
		
		Assert.assertTrue(  consultoria.getConsultasFemenino().get("Lechon") == 1 )
		Assert.assertTrue(  consultoria.getConsultasFemenino().get("Torta") == 1 )
		Assert.assertTrue(  consultoria.getConsultasMasculino().get("Pure") == 1 )
		Assert.assertTrue(  consultoria.getConsultasMasculino().get("Lechon") == 1 )
		
		//ConsultasXSexo.reset()
		recetario.reset()
	}
	
	@Test
	def void CantiadDeConsultasXHora(){
		println("____Consultas X HORA____")
		seteoRecetario()
	
		usuarioFemenino.getRecetasConAcceso()
		usuarioMasculino.getRecetasConAcceso()	
		
		Assert.assertTrue(  consultoria.getConsultasXHora().get(calendario.get( Calendar.HOUR_OF_DAY )) == 8 )
		
		//ConsultasXHora.reset()
		recetario.reset()
	}
	
	@Test
	def void CantidadDeConsultasXVeganos(){
		println("____Consultas X VEGANOS___")
		
		usuarioFemenino.getRecetasConAcceso()
		usuarioMasculino.getRecetasConAcceso()	
		
		println( "La cantidad de Consultas de Veganos = " + consultoria.getConsultasVegano() )
		Assert.assertTrue( consultoria.getConsultasVegano() == 1 ) // CORREGIR! 2?
		recetario.reset()
		//ConsultasXVeganos.reset() 
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
		pepe.addConsultas(  "ConsultasXSexo" )
		pepe.addConsultas(  "ConsultasXRecetas" )
		pepe.addConsultas(  "ConsultasXVegano" )
		pepe.addConsultas( "ConsultasXHora" )
		return pepe
	}
	
	def getUsuarioFemenino(){
		val mariana = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Mariana Lopez",Sexo.FEMENINO,fecha)
	
		// Agregar Recetas que conoce
		mariana.agregarReceta( getTorta )
		mariana.addConsultas(  "ConsultasXSexo" )
		mariana.addConsultas(  "ConsultasXRecetas" )
		mariana.addConsultas(  "ConsultasXVegano" )
		mariana.addConsultas( "ConsultasXHora" )
		val vegano = new UsuarioVegano( mariana )
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