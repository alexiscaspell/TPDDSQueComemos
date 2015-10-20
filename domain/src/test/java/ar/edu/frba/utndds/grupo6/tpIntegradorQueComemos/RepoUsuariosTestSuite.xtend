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
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.UsuariosRepository

class RepoUsuariosTestSuite {
	
	Administrador admin = new Administrador
	
	UsuariosRepository repositorio = new UsuariosRepository	
	
	List<Condicion> listaCondicion 
		
	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	
	Date fecha = format.parse("01-04-1970")
	
	FabricaPerfilUsuario fabrica
	
	Usuario usuarioFabricado
	
	Usuario user
	
	UsuarioPosta pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)

	@Test
	def void agregarUsuarioARepoUsuariosSinAdministrador(){
						
		UsuariosRepository.getInstance().create( pepe )
			
		user = repositorio.searchByName( pepe.nombre ).head	
		
		Assert.assertTrue(user.equals(pepe))
	
	}

		
	@Test
	def void agregarUsuarioARepoUsuariosConAdministrador(){
						
		admin.agregarSolicitud(pepe)
		
		admin.aceptarUsuario(pepe)
			
		user = repositorio.searchByName( pepe.nombre ).head	
		
		Assert.assertTrue(user.equals(pepe))
		
	}
	
	@Test
	def void agregarUsuarioConCondicionesARepoUsuarios(){
		
		pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		
		listaCondicion = Arrays.asList(Condicion.VEGANO,Condicion.DIABETICO)
		
		fabrica = new FabricaPerfilUsuario(listaCondicion,pepe)
		
		usuarioFabricado = fabrica.crearPerfil()
					
		admin.agregarSolicitud(usuarioFabricado)
		
		admin.aceptarUsuario(usuarioFabricado)
	
		user = repositorio.searchByName( usuarioFabricado.nombre ).head	
	
		Assert.assertTrue(user.equals(user))
		
	}
	
	@Test
	def void actualizarUsuarioConCondicionesARepoUsuarios(){
			
		listaCondicion = Arrays.asList(Condicion.VEGANO)		
		val FabricaPerfilUsuario fabrica2 = new FabricaPerfilUsuario(listaCondicion,pepe)	
		val Usuario userVegano = fabrica2.crearPerfil()
	
		repositorio.create(userVegano)
		
		listaCondicion = Arrays.asList(Condicion.VEGANO,Condicion.DIABETICO)		
		fabrica = new FabricaPerfilUsuario(listaCondicion,pepe)	
		val Usuario userVeganoDiabetico = fabrica.crearPerfil()
		
		repositorio.update(	userVeganoDiabetico)
		
		user = repositorio.searchByName( userVeganoDiabetico.nombre ).head	
		
		Assert.assertTrue(! repositorio.existe(userVegano)&&user.equals(userVeganoDiabetico))		
		
		}
	
	@Test
	def void listUsuarioConCondicionesEnRepoUsuarios(){
		
		listaCondicion = Arrays.asList(Condicion.VEGANO)
		
		fabrica = new FabricaPerfilUsuario(listaCondicion,pepe)
		
		val Usuario vegano = fabrica.crearPerfil() 
		
		listaCondicion = Arrays.asList(Condicion.DIABETICO)
		
		val FabricaPerfilUsuario fabrica2 = new FabricaPerfilUsuario(listaCondicion,pepe)		
	
		val Usuario diabetico = fabrica2.crearPerfil()
		
		repositorio.create(diabetico)
	
		repositorio.create(vegano)
	
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
			
			repositorio.create(pepe)
			
			val Usuario usuarioEncontrado = repositorio.validarNickYContraseña("pepe","123")
											
			Assert.assertTrue(usuarioEncontrado.equals(pepe))
		
	}
	
			@Test
	def void crearPerfilDeUsuarioVeganoYBuscarPorNickYPass(){
				
			//pepe.login = new Login("pepe","123")
			
			pepe.nickName = "pepe"
			
			pepe.password = "123"
			
			val vegano = new UsuarioVegano(pepe)
			
			repositorio.create(vegano)
			
			val Usuario usuarioEncontrado = repositorio.validarNickYContraseña("pepe","123")
											
			Assert.assertTrue(usuarioEncontrado.equals(vegano))
		
	}
	
	
	
	
}