package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Date
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConSal
import org.junit.Test
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.UsuariosRepository
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.RecetasRepository
import org.junit.Assert

class TestParcial {
	
	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	Date fecha = format.parse("01-04-1970")
	
	
	val pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
	val recetaSal = new recetaConSal()
	val Pure = recetaSal.cumple( pepe.nombre )
	val RepoUsuarios = UsuariosRepository.getInstance()
	val RepoRecetas = RecetasRepository.getInstance()
	
	@Test
	def testAgregarRecetaFavotirta( ){
		pepe.favoritas.add( Pure )
		RepoUsuarios.create( pepe )
		val usuario = RepoUsuarios.searchByName( pepe.nombre ).head
		Assert.assertTrue( ! usuario.favoritas.empty )
	}

}