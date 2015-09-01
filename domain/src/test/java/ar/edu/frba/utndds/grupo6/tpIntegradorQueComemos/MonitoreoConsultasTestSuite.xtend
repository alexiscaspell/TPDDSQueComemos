package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import org.junit.Assert
import org.junit.Before
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.text.DateFormat
import java.util.Date
import java.text.SimpleDateFormat
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConAzucar
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConSal
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConCarne
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import java.util.Calendar

class MonitoreoConsultasTestSuite {
	
	private DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	private Date fecha = format.parse("01-04-1970")
	private Calendar calendario = Calendar.getInstance();
	private Recetario  recetario =  Recetario .getInstance()
	recetaConAzucar recetaAzucar = new recetaConAzucar()
	recetaConSal recetaSal = new recetaConSal()
	recetaConCarne recetaCarne = new recetaConCarne()
	
	// Observadores
	private ConsultasXSexo ConsultasXSexo =  new ConsultasXSexo()
	private ConsultasXRecetas ConsultasXRecetas =  new ConsultasXRecetas()
	private ConsultasXVeganos ConsultasXVeganos =  new ConsultasXVeganos()
	private ConsultasXHora ConsultasXHora =  new ConsultasXHora()
	
	// Usuarios
	private Usuario usuarioFemenino;
	private Usuario usuarioMasculino;
	
	@Before
	def void SetUp()
	{
		Recetario.getInstance().reset();
		usuarioFemenino = getUsuarioFemenino();
		usuarioMasculino = getUsuarioMasculino();
	}		
	
	@Test
	def void CantidadDeConsultasTest()
	{
		// Seteo del resetario para pruebas
		seteoRecetario();
			
		usuarioFemenino.getRecetasConAcceso();
		usuarioMasculino.getRecetasConAcceso();
						
		Assert.assertEquals(ConsultasXRecetas.getEstadistica().get("Milanesas"), 2);
		Assert.assertEquals(ConsultasXRecetas.getEstadistica().get("Torta"), 3);
		Assert.assertEquals(ConsultasXRecetas.getEstadistica().get("Pure"), 4);
		Assert.assertEquals(ConsultasXHora.getEstadistica.get(calendario.get(Calendar.HOUR_OF_DAY )), 2);
	}
		
		
	@Test 
	def void CantidadDeConsultasXSexoTest()
	{
		// Seteo del resetario para pruebas
		seteoRecetario()
			
		usuarioFemenino.getRecetasConAcceso()
		usuarioMasculino.getRecetasConAcceso()		
		
		Assert.assertEquals(ConsultasXSexo.getEstadisticaFemenino().get("Milanesas"), 1)
		Assert.assertEquals(ConsultasXSexo.getEstadisticaFemenino().get("Torta"), 2)
		Assert.assertEquals(ConsultasXSexo.getEstadisticaMasculino().get("Pure"), 2)
		Assert.assertEquals(ConsultasXSexo.getEstadisticaMasculino().get("Milanesas"), 1)
	}
	
	@Test
	def void CantiadDeConsultasXHora()
	{
		seteoRecetario()
	
		usuarioFemenino.getRecetasConAcceso()
		usuarioMasculino.getRecetasConAcceso()	
		
		Assert.assertTrue(  ConsultasXHora.getEstadistica.get(calendario.get( Calendar.HOUR_OF_DAY )) == 2 )
	}
	
	@Test
	def void CantidadDeConsultasXVeganos()
	{
		seteoRecetario()
		
		usuarioFemenino.getRecetasConAcceso()
		usuarioMasculino.getRecetasConAcceso()	
		
		Assert.assertEquals(ConsultasXVeganos.getEstadistica(), 2)
	}
	
	def seteoRecetario(){
		recetario.agregar( recetaSal.cumple(usuarioMasculino) )
		recetario.agregar( recetaAzucar.cumple(usuarioFemenino) )
		recetario.agregar( recetaCarne.cumple(usuarioFemenino) )
	}
	
	def getUsuarioMasculino() {
		val pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		// Agregar Recetas que conoce
		pepe.agregarReceta( recetaSal.cumple(usuarioMasculino) )
		// Agregar Observadores
		pepe.addObservador(ConsultasXSexo)
		pepe.addObservador(ConsultasXRecetas)
		pepe.addObservador(ConsultasXVeganos)
		pepe.addObservador(ConsultasXHora)
		return pepe
	}
	
	def getUsuarioFemenino(){
		val mariana = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Mariana Lopez",Sexo.FEMENINO,fecha)
	
		// Agregar Recetas que conoce
		mariana.agregarReceta(recetaAzucar.cumple(usuarioFemenino))
		val vegano = new UsuarioVegano(mariana)
		vegano.addObservador(ConsultasXSexo)
		vegano.addObservador(ConsultasXRecetas)
		vegano.addObservador(ConsultasXHora)
		vegano.addObservador(ConsultasXVeganos)
			
		return vegano
	}
	
/*	
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
*/	
	
	
	
	
	
	
}