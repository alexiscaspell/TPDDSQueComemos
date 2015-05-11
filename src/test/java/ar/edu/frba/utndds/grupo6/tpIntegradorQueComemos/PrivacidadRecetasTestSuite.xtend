package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import java.util.Date
import java.util.HashMap
import java.util.ArrayList
import org.junit.Assert
import java.text.DateFormat
import java.text.SimpleDateFormat
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Dificultad

class PrivacidadRecetasTestSuite {
	
	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	Date fecha = format.parse("01-04-1970")
	
	Usuario usuario1 = getUsuario1();
	Usuario usuario2 = getUsuario2();
	
	@Test 
	def Usuario1ModificaRecetaDeUsuario1()
	{
		val receta = getRecetaPure()
		receta.tipo = TipoReceta.PRIVADA
		Assert.assertTrue(receta.puedeModificar(usuario1))			
	}
	
	@Test 
	def Usuario2NoPuedeModificarRecetaDeUsuario1()
	{
		val receta = getRecetaPure()
		receta.tipo = TipoReceta.PRIVADA
		Assert.assertFalse(receta.puedeModificar(usuario2))			
	}
	
	@Test
	def Usuario2ModificaRecetaUsuario1PorSerPublica()
	{
		val receta = getRecetaPure()
		receta.tipo = TipoReceta.PUBLICA
		Assert.assertTrue(receta.puedeModificar(usuario2))	
	}
	
	def Usuario getUsuario1()
	{
		new UsuarioPosta(82,1.78,Rutina.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
	}
	
	def Usuario getUsuario2()
	{
		new UsuarioPosta(90,1.62,Rutina.MEDIANO,"Pablo Lopez",Sexo.MASCULINO,fecha)
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
		recetaSimple
	}
	
}