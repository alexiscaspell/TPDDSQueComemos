package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import java.util.Date
import java.util.HashMap
import java.util.ArrayList
import org.junit.Assert

class PrivacidadRecetasTestSuite {
	
	Date fecha = new Date(1970,01,04)
	
	Usuario usuario1;
	Usuario usuario2;
	Receta receta
	
	@Test 
	def Usuario2ModificaRecetaDeUsuario1(){
		crearUsuariosConReceta()
		Assert.assertFalse(  receta.puedeSerModificada( usuario1 )  )			
	}
	
	@Test 
	def Usuario2ModificaRecetaDeUsuario2(){
		crearUsuariosConReceta()
		Assert.assertTrue(  receta.puedeSerModificada( usuario1 )  )			
	}
	
	def crearUsuariosConReceta(){
	
	  	usuario1 = new UsuarioPosta(100,1.78,Rutinas.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		usuario2 = new UsuarioPosta(90,1.62,Rutinas.LEVE,"Pablo Lopez",Sexo.MASCULINO,fecha)
		
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
		usuario1.agregarRecetaSimple( nombre, ingredientes, condimentos, explicacion, Dificultad.DIFICIL, temporadas) 
		
		receta = usuario1.getReceta( nombre )
		
	} 
	
}