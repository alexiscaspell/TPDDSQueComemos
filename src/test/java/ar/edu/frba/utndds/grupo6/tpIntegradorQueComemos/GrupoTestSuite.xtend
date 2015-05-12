package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.text.DateFormat
import java.util.Date
import java.text.SimpleDateFormat
import org.junit.Assert

class GrupoTestSuite {
	
	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	Date fecha = format.parse("01-04-1970")
		
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