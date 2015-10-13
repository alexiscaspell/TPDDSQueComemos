package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Arrays
import java.util.Date
import java.util.List
import org.junit.Assert
import org.junit.Test

class RepoUsuariosTestSuite {
	
	Administrador admin = new Administrador
	
	RepoUsuarios repositorio = new RepoUsuarios	
	
	List<Condicion> listaCondicion 
		
	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	
	Date fecha = format.parse("01-04-1970")
	
	FabricaPerfilUsuario fabrica
	
	Usuario usuarioFabricado
	
	Usuario user
	
	UsuarioPosta pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		
	@Test
	def void agregarUsuarioARepoUsuarios(){
						
	admin.agregarSolicitud(pepe)
	
	admin.repoUsuario = repositorio
	
	admin.aceptarUsuario(pepe)
		
	user = repositorio.get(pepe)	
	
	Assert.assertTrue(user.equals(pepe))
		
	}
	
		@Test
	def void agregarUsuarioConCondicionesARepoUsuarios(){
		
	pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
	
	listaCondicion = Arrays.asList(Condicion.VEGANO,Condicion.DIABETICO)
	
	fabrica = new FabricaPerfilUsuario(listaCondicion,pepe)
	
	usuarioFabricado = fabrica.crearPerfil()
				
	admin.agregarSolicitud(usuarioFabricado)
	
	admin.repoUsuario = repositorio
	
	admin.aceptarUsuario(usuarioFabricado)
	
	user = repositorio.get(usuarioFabricado)	
	
		Assert.assertTrue(user.equals(user))
		
	}
	
		@Test
	def void actualizarUsuarioConCondicionesARepoUsuarios(){
			
	listaCondicion = Arrays.asList(Condicion.VEGANO)		
	val FabricaPerfilUsuario fabrica2 = new FabricaPerfilUsuario(listaCondicion,pepe)	
	val Usuario userVegano = fabrica2.crearPerfil()
	
	repositorio.add(userVegano)
	
	listaCondicion = Arrays.asList(Condicion.VEGANO,Condicion.DIABETICO)		
	fabrica = new FabricaPerfilUsuario(listaCondicion,pepe)	
	val Usuario userVeganoDiabetico = fabrica.crearPerfil()
	
	repositorio.update(	userVeganoDiabetico)
	
	user = repositorio.get(userVeganoDiabetico)	
	
	Assert.assertTrue(!repositorio.existe(userVegano)&&user.equals(userVeganoDiabetico))		
	
	}
	
	@Test
	
	def void listUsuarioConCondicionesEnRepoUsuarios(){
		
		listaCondicion = Arrays.asList(Condicion.VEGANO)
		
		fabrica = new FabricaPerfilUsuario(listaCondicion,pepe)
		
		val Usuario vegano = fabrica.crearPerfil() 
		
		listaCondicion = Arrays.asList(Condicion.DIABETICO)
		
		val FabricaPerfilUsuario fabrica2 = new FabricaPerfilUsuario(listaCondicion,pepe)		
	
		val Usuario diabetico = fabrica2.crearPerfil()
		
		repositorio.add(diabetico)
	
		repositorio.add(vegano)
	
		val List<Usuario> listaUsuarios = repositorio.list(vegano)
	
		Assert.assertTrue(listaUsuarios.contains(vegano)&&!listaUsuarios.contains(diabetico))		
	}
	
	@Test
	def void crearPerfilDeUsuarioClonaYNoReferencia(){
				
			val vegano = new UsuarioVegano(pepe)
			
			val Usuario clonVegano = vegano.crearPerfil
			
			clonVegano.nombre = "Satan"
			
			Assert.assertFalse(vegano.nombre.equals(clonVegano.nombre))
		
	}
	
		@Test
	def void crearPerfilDeUsuarioYBuscarPorNickYPass(){
				
			//pepe.login = new Login("pepe","123")
			
			pepe.nickName = "pepe"
			
			pepe.password = "123"
			
			repositorio.add(pepe)
			
			val Usuario usuarioEncontrado = repositorio.validarNickYContraseña("pepe","123")
											
			Assert.assertTrue(usuarioEncontrado.equals(pepe))
		
	}
	
			@Test
	def void crearPerfilDeUsuarioVeganoYBuscarPorNickYPass(){
				
			//pepe.login = new Login("pepe","123")
			
			pepe.nickName = "pepe"
			
			pepe.password = "123"
			
			val vegano = new UsuarioVegano(pepe)
			
			repositorio.add(vegano)
			
			val Usuario usuarioEncontrado = repositorio.validarNickYContraseña("pepe","123")
											
			Assert.assertTrue(usuarioEncontrado.equals(vegano))
		
	}
	
	
	
	
}