package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos
import org.junit.Test
import org.junit.Assert
import java.util.Date
import java.text.DateFormat
import java.text.SimpleDateFormat
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion
import java.util.ArrayList
import java.util.List


class RepoUsuariosTestSuite {
	
	Administrador admin = new Administrador
	
	RepoUsuarios repositorio = new RepoUsuarios
	
	Usuario user
	
	Usuario pepe
	
	Usuario vegano
	
	Usuario diabetico
		
	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	
	Date fecha = format.parse("01-04-1970")
	
	@Test
	def void agregarUsuarioARepoUsuarios(){
		
	val Usuario pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
				
	admin.agregarSolicitud(pepe)
	
	admin.repoUsuario = repositorio
	
	admin.aceptarUsuario(pepe)
	
	user = repositorio.get(pepe)	
	
		Assert.assertTrue(user.equals(pepe))
		
	}
	
		@Test
	def void agregarUsuarioConCondicionesARepoUsuarios(){
		
	pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
	
	vegano = new UsuarioVegano(pepe)
	
	diabetico = new UsuarioDiabetico(vegano)
				
	admin.agregarSolicitud(diabetico)
	
	admin.repoUsuario = repositorio
	
	admin.aceptarUsuario(diabetico)
	
	user = repositorio.get(diabetico)	
	
		Assert.assertTrue(user.equals(diabetico))
		
	}
	
		@Test
	def void actualizarUsuarioConCondicionesARepoUsuarios(){
		
	pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
	
	vegano = new UsuarioVegano(pepe)
	
	diabetico = new UsuarioDiabetico(vegano)
	
	repositorio.update(	diabetico)
	
	user = repositorio.get(diabetico)	
	
		Assert.assertTrue(!repositorio.existe(vegano)&&user.equals(diabetico))		
	}
	
	@Test
	
	def void listUsuarioConCondicionesEnRepoUsuarios(){//El list al parecer filtra todo
		
	pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
	
	vegano = new UsuarioVegano(pepe)
	
	vegano.condicion.add(Condicion.VEGANO)
	
	diabetico = new UsuarioDiabetico(pepe)
	
	diabetico.condicion.add(Condicion.DIABETICO)
	
	repositorio.add(diabetico)
	
	repositorio.add(vegano)
	
	val List<Usuario> listaUsuarios = repositorio.list(vegano)
	
		Assert.assertTrue(listaUsuarios.contains(vegano)&&!listaUsuarios.contains(diabetico))		
	}
	
	
	
}