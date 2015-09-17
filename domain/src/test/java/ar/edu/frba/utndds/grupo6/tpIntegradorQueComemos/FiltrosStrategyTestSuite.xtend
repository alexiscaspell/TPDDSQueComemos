package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import java.text.SimpleDateFormat
import java.text.DateFormat
import java.util.Date
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.util.ArrayList
import java.util.HashMap
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import org.junit.Assert
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import queComemos.entrega3.dominio.Dificultad

class FiltroStrategyTestSuite {

	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	Date fecha = format.parse("01-04-1970")
	Usuario usuario1 = getUsuario();
	
	@Test
	def void FiltroStrategTodosLosFiltros() {
		val FiltroCompleto = new FiltroPostaS()
		// Filtros
		FiltroCompleto.agregarFiltroNoLeGusta()
		FiltroCompleto.agregarFiltroExcesoCalorias()
		FiltroCompleto.agregarFiltroCaros()
		FiltroCompleto.agregarFiltroCondicionesPreexistentes()
		val listaFiltrada  = FiltroCompleto.aplicarFiltro( usuario1.getRecetas() , usuario1 )
		//println( "La cantidad de elementos en la lista filtrada = " + listaFiltrada.size )
		Assert.assertTrue( listaFiltrada.size == 0 ) // CORREGIR!!
	}
	
	@Test
	def void FiltroStrategyCarosCaloriasYNoLeGusta() {
		val FiltroCarosCaloriasYNoLeGusta = new FiltroPostaS()
		//Filtros
		FiltroCarosCaloriasYNoLeGusta.agregarFiltroNoLeGusta()
		FiltroCarosCaloriasYNoLeGusta.agregarFiltroCaros()
		FiltroCarosCaloriasYNoLeGusta.agregarFiltroExcesoCalorias()
		
		val listaFiltrada  = FiltroCarosCaloriasYNoLeGusta.aplicarFiltro(  usuario1.getRecetas() , usuario1 )
		//println( "La cantidad de elementos en la lista filtrada = " + listaFiltrada.size )
		Assert.assertTrue( listaFiltrada.size == 1 )
	}
	
	@Test
	def void FiltroStrategyCarosYNoLeGusta() {
		val FiltroCarosYNoLeGusta = new FiltroPostaS()
		//Filtros
		FiltroCarosYNoLeGusta.agregarFiltroNoLeGusta()
		FiltroCarosYNoLeGusta.agregarFiltroCaros()
		
		val listaFiltrada  = FiltroCarosYNoLeGusta.aplicarFiltro(  usuario1.getRecetas(), usuario1 )
		//println( "La cantidad de elementos en la lista filtrada = " + listaFiltrada.size )
		Assert.assertTrue( listaFiltrada.size == 2 )
	}
	
	@Test
	def void FiltroStrategyNoLeGusta() {
		val FiltroNoLeGusta = new FiltroPostaS()
		//Filtros
		FiltroNoLeGusta.agregarFiltroNoLeGusta()
		
		val listaFiltrada  = FiltroNoLeGusta.aplicarFiltro(  usuario1.getRecetas(), usuario1 )
		//println( "La cantidad de elementos en la lista filtrada = " + listaFiltrada.size )
		Assert.assertTrue( listaFiltrada.size == 3 )
	}
	
	@Test
	def void FiltroStrategySinFiltro() {
		val SinFiltro = new FiltroPostaS()		
		val listaFiltrada  = SinFiltro.aplicarFiltro(  usuario1.getRecetas(), usuario1 )
		//println( "La cantidad de elementos en la lista filtrada = " + listaFiltrada.size )
		Assert.assertTrue( listaFiltrada.size == 4 )
	}
	
	def getUsuario(){
		val pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		val platosQueNoLeGustan = new ArrayList<String>()
		platosQueNoLeGustan.add("Pure")
		pepe.platosQueNoLeGustan = platosQueNoLeGustan
		// Agregar Recetas que conoce
		pepe.agregarReceta( getRecetaNoLeGusta )
		pepe.agregarReceta( getRecetaCara )
		pepe.agregarReceta( getRecetaCalorias )		
		pepe.agregarReceta( getRecetaInadecuada )
		return pepe
	}
	
	def Receta getRecetaNoLeGusta()
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
		val recetaSimple = new Receta(usuario1, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple.calorias=100
		recetaSimple
	}
	
	def Receta getRecetaCara()
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
		val recetaSimple = new Receta(usuario1, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple.calorias=150
		recetaSimple
	}
	
	def Receta getRecetaCalorias()
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
		val recetaSimple = new Receta(usuario1, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple.calorias=600
		recetaSimple
	}
	
	def Receta getRecetaInadecuada()
	{		
		val nombre = "ZZZZZ"
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
		recetaSimple.calorias=300
		recetaSimple
	}
}


