package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import org.junit.Assert
import java.util.HashMap
import java.util.ArrayList
import java.util.Date
import java.text.DateFormat
import java.text.SimpleDateFormat
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Dificultad
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import java.util.List

class GrupoTestSuite {
	
	/*----------------VARIABLES------------------*/
	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	Date fecha = format.parse("01-04-1970")
	/*---------------FIN VARIABLES---------------*/
	
	
	/*-----------------USUARIOS-----------------*/
	Usuario hipertenso
	Usuario vegano
	
	private val pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
	private val carlos = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
	private val raul = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
	/*---------------FIN USUARIOS---------------*/
	
		
	/*---------------RECETAS---------------*/
	public def Receta pureConAzucarYSinSal()
	{	
		val usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE,"Juan Carlos Lopez",Sexo.MASCULINO,fecha)
		val nombre = "Pure"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.PAPA, 1000)
		val condimentos = new HashMap<Condimento, Integer>()
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
		val recetaSimple = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple
	}

	public def Receta getRecetaMilanesas()
	{
		val usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE,"Juan Carlos Lopez",Sexo.MASCULINO,fecha)
		val nombre = "Milanesas"
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
		val recetaSimple = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple
	}
	/*---------------FIN RECETAS---------------*/
	
	
	/*---------------GRUPOS---------------*/		
	public def getGrupoDePrueba(){
		
		val List<Usuario> listaUsuariosDelGrupo = new ArrayList()
			listaUsuariosDelGrupo.add( vegano = new UsuarioVegano(pepe) )
			listaUsuariosDelGrupo.add( hipertenso = new UsuarioHipertenso(raul) )
			listaUsuariosDelGrupo.add( carlos )	
		
		val List<Receta> listaRecetasPreferidas = new ArrayList()
			listaRecetasPreferidas.add( pureConAzucarYSinSal() )
		
		val Grupo grupoDePruebas = new Grupo()
		grupoDePruebas.integrantes = listaUsuariosDelGrupo
		grupoDePruebas.recetasPreferidas = listaRecetasPreferidas		
		
		grupoDePruebas
	}
	
	@Test
	def void grupoDePruebaPuedeComerPureConAzucarYSinSal()
	{
		val grupoDePruebas = getGrupoDePrueba()			
		val pure = pureConAzucarYSinSal()
		
		Assert.assertTrue(grupoDePruebas.puedeComer(pure))				
	}
		
	@Test
	def void usuariosCompartenGrupo()
	{
		val pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Pepe",Sexo.MASCULINO, fecha)
		val lui = new UsuarioPosta(70,1.70,Rutina.MEDIANO,"Lui",Sexo.MASCULINO, fecha)
		
		val grupo = new Grupo()
		grupo.agregar(pepe)
		grupo.agregar(lui)
		
		Assert.assertTrue(pepe.comparteGrupo(lui))
		Assert.assertTrue(lui.comparteGrupo(pepe))
	}
	
	@Test
	def void usuariosNoCompartenGrupo()
	{
		val pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Pepe",Sexo.MASCULINO, fecha)
		val lui = new UsuarioPosta(70,1.70,Rutina.MEDIANO,"Lui",Sexo.MASCULINO, fecha)
		
		val grupo = new Grupo()
		grupo.agregar(pepe)
		
		val grupo1 = new Grupo()
		grupo1.agregar(lui)
		
		Assert.assertFalse(pepe.comparteGrupo(lui))
		Assert.assertFalse(lui.comparteGrupo(pepe))
	}
}