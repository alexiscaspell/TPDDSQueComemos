package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import org.junit.Assert
import java.util.HashMap
import java.util.ArrayList
import java.util.Date
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Excepciones.RecetaInvalidaExc
import java.text.DateFormat
import java.text.SimpleDateFormat
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Dificultad

class RecetasTestSuite {
	
	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	Date fecha = format.parse("01-04-1970")
	
	@Test(expected=RecetaInvalidaExc)
	def void recetaInvalida()
	{
		val usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE,"Juan Carlos Lopez",Sexo.MASCULINO,fecha)
		val nombre = "Receta 1"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.PAPA, 1000)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.SAL, 10)
		val explicacion = "1 - Paso 1\n" + 
						  "2 - Paso 2\n" +
						  "3 - Paso 3\n" +
						  "4 - Paso 4\n"
		val temporadas = new ArrayList<Temporada>()		
		temporadas.add(Temporada.INVIERNO)		  
		val invalida = new RecetaSimple(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		invalida.calorias = 4
		invalida.validar()
	}
	
	@Test
	def void recetaPure()
	{
		val pure = getRecetaPure()
		Assert.assertEquals(100, pure.cantidadDeAzucar(), 0.01)		
	}
	
	@Test
	def void crearRecetaMilanesasConPure()
	{
		val recetasSimples = new ArrayList<Receta>()
		recetasSimples.add(getRecetaPure())
		recetasSimples.add(getRecetaMilanesas())	
		val recetaMilanesasConPure = new RecetaCompuesta(recetasSimples)
		Assert.assertEquals(100, recetaMilanesasConPure.cantidadDeAzucar(), 0.01)		
	}
	
	@Test
	def void cantidadIngredientesPure()
	{
		val pure = getRecetaPure()
		Assert.assertTrue(pure.getIngredientes().values.length == 1)
	}
	
	@Test
	def void cantidadIngredientesMilanesasConPure()
	{
		val recetasSimples = new ArrayList<Receta>()
		recetasSimples.add(getRecetaPure())
		recetasSimples.add(getRecetaMilanesas())	
		val recetaMilanesasConPure = new RecetaCompuesta(recetasSimples)
		Assert.assertTrue(recetaMilanesasConPure.getIngredientes().values.length == 4)
	}		
	
	def Receta getRecetaPure()
	{	
		val usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE,"Juan Carlos Lopez",Sexo.MASCULINO,fecha)
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
		val recetaSimple = new RecetaSimple(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple
	}
	
	def Receta getRecetaMilanesas()
	{
		val usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE,"Juan Carlos Lopez",Sexo.MASCULINO,fecha)
		val nombre = "Pure"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.CARNE, 1000)
		ingredientes.put(Ingrediente.HUEVO, 6)
		ingredientes.put(Ingrediente.PAN_RAYADO, 6)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.SAL, 10)
		condimentos.put(Condimento.ACEITE, 10)		
		val explicacion = "1 - Cortar la carne\n" + 
						  "2 - Pasar la carne por el huevo" +
						  "3 - Pasar la carne por pan rayado" +
						  "4 - Hornear 25 minutos"
		val temporadas = new ArrayList<Temporada>()		
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)						  
		val recetaSimple = new RecetaSimple(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple
	}
}