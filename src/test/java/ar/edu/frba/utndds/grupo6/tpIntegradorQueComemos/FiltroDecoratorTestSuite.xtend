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
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import queComemos.entrega3.dominio.Dificultad

class FiltroDecoratorTestSuite {
	
	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	Date fecha = format.parse("01-04-1970")
	Usuario usuario1 = getUsuario();
	
	def getUsuario() 
	{
		val pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		val platosQueNoLeGustan = new ArrayList<String>()
		platosQueNoLeGustan.add("CHORI")
		platosQueNoLeGustan.add("Pure")
		pepe.platosQueNoLeGustan = platosQueNoLeGustan
	   	return pepe
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
		val recetaSimple = new Receta(usuario1, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple.calorias=100
		recetaSimple
	}

	def Receta getRecetaLechon()
	{		
		val nombre = "Lechon"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.LECHON, 1000)
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
		val recetaSimple = new Receta(usuario1, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple.calorias=1000
		recetaSimple
	}
	
	
/*-------------------------------------Test FiltroNoLeGustaD----------------------------------------------------------*/
//Caso de testeo cuando el usuario posee RecetaPure, sabiendo que el pure no le gusta.
		
	@Test
	def void NoLeGustaPure()
	{
		Recetario.getInstance().reset()
		val FiltroDisgusta = new FiltroPostaD();
		val filtroDisgusta = new FiltroNoLeGustaD(FiltroDisgusta);
		usuario1.agregarReceta(getRecetaPure())
		val recetasConAcceso = usuario1.getRecetasConAcceso();
		val tamanio = filtroDisgusta.aplicarFiltro(recetasConAcceso, usuario1).size;
		Assert.assertEquals(tamanio, 0);			
	}
	

//Caso de testeo cuando el usuario posee RecetaLechon, sabiendo que el lechon le gusta.

	@Test
	def void LeGustaLechon()
	{
		Recetario.getInstance().reset()
		val FiltroDisgusta = new FiltroPostaD();
		val filtroDisgusta = new FiltroNoLeGustaD(FiltroDisgusta);
		usuario1.agregarReceta(getRecetaLechon)
		val recetasConAcceso = usuario1.getRecetasConAcceso();
		val tamanio = filtroDisgusta.aplicarFiltro(recetasConAcceso, usuario1).size;
		Assert.assertEquals(tamanio, 1);			
	}


//Caso de testeo cuando el usuario posee RecetaLechon y RecetaPure, sabiendo que el lechon le gusta y el pure no.

	@Test
	def void LeGustaLechonNoLeGustaPure()
	{
		Recetario.getInstance().reset()
		val FiltroDisgusta = new FiltroPostaD();
		val filtroDisgusta = new FiltroNoLeGustaD(FiltroDisgusta);
		usuario1.agregarReceta(getRecetaLechon)
		usuario1.agregarReceta(getRecetaPure)
		Assert.assertTrue(filtroDisgusta.aplicarFiltro(  usuario1.getRecetasConAcceso(),usuario1).size==1)			
	}

/*-------------------------------------Test FiltroExcesoCaloriasD---------------------------------------------------- */

//Caso de testeo cuando el usuario posee RecetaPuer que no se excede en calorias.
	
	@Test
	def void PurePocasCalorias()
	{
		Recetario.getInstance().reset()
		val FiltroCalorias = new FiltroPostaD();
		val filtroCalorias = new FiltroExcesoCaloriasD(FiltroCalorias);
		usuario1.agregarReceta(getRecetaPure)
		Assert.assertTrue(filtroCalorias.aplicarFiltro(  usuario1.getRecetasConAcceso(),usuario1).size==1)			
	}
	
	
//Caso de testeo cuando el usuario posee RecetaLechon que se excede en calorias.
	
	@Test
	def void LechonMuchasCalorias()
	{
		Recetario.getInstance().reset()
		val FiltroCalorias = new FiltroPostaD();
		val filtroCalorias = new FiltroExcesoCaloriasD(FiltroCalorias);
		usuario1.agregarReceta(getRecetaLechon)
		Assert.assertTrue(filtroCalorias.aplicarFiltro(  usuario1.getRecetasConAcceso(),usuario1).size==0)			
	}


//Caso de testeo cuando el usuario posee RecetaPure y RecetaLechon.
	
	@Test
	def void ExcesoCaloriasPureLechon()
	{
		Recetario.getInstance().reset()
		val FiltroCalorias = new FiltroPostaD();
		val filtroCalorias = new FiltroExcesoCaloriasD(FiltroCalorias);
		usuario1.agregarReceta(getRecetaLechon)
		usuario1.agregarReceta(getRecetaPure)
		Assert.assertTrue(filtroCalorias.aplicarFiltro(  usuario1.getRecetasConAcceso(),usuario1).size==1)			
	}

/*-----------------------------------Test FiltroCaroD---------------------------------------------------------------- */
//Caso de testeo cuando el usuario posee RecetaPure y RecetaLechon, sabiendo que lechon es un ingrediente caro.
	
	@Test
	def void CaroLechonPure()
	{
		Recetario.getInstance().reset()
		val FiltroCaro = new FiltroPostaD();
		val filtroCaro = new FiltroCarosD(FiltroCaro);
		usuario1.agregarReceta(getRecetaLechon)
		usuario1.agregarReceta(getRecetaPure)
		Assert.assertTrue(filtroCaro.aplicarFiltro(  usuario1.getRecetasConAcceso(),usuario1).size==1)			
	}
	
	
//Caso de testeo cuando el usuario posee RecetaPure.
	
	@Test
	def void PureNoEsCaro()
	{
		Recetario.getInstance().reset()
		val FiltroCaro = new FiltroPostaD();
		val filtroCaro = new FiltroCarosD(FiltroCaro);
		usuario1.agregarReceta(getRecetaPure)
		Assert.assertTrue(filtroCaro.aplicarFiltro(  usuario1.getRecetasConAcceso(),usuario1).size==1)			
	}
	
	
//Caso de testeo cuando el usuario solo posee RecetaLechon.

	@Test
	def void LechonEsCaro()
	{
		Recetario.getInstance().reset()
		val FiltroCaro = new FiltroPostaD();
		val filtroCaro = new FiltroCarosD(FiltroCaro);
		usuario1.agregarReceta(getRecetaLechon)
		Assert.assertTrue(filtroCaro.aplicarFiltro(  usuario1.getRecetasConAcceso(),usuario1).size==0)			
	}
	

}