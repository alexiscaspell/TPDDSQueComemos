package AplicationModel

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.UsuariosRepository

@Accessors
class Repositorio {

	UsuarioTestBuilder usuarioBuilder = new UsuarioTestBuilder()

	UsuariosRepository repositorio = UsuariosRepository.getInstance

	new() {
		/*
		var user1 = usuarioBuilder.usuarioBuilder("Lucas")
		//user1.login = new Login("Lucas", "123")
		
		user1.nickName = "Lucas"
		user1.password = "123"
		//var user2 = usuarioBuilder.usuarioBuilder("Mariano")
		//user1.login = new Login("Mariano", "456")
		
		//user2.nickName = "Mariano"
		//user2.password = "456"

		repositorio.create(user1)
		//repositorio.create(user2)
		*/
	}

	def getUsuario(String name) {
		println("[RepoUsuarios] getUsuario() de name = " + name)
		repositorio.searchByName(name)
	}
	
	def loguear( Usuario usuario ){

		val Usuario usuarioEncontrado = repositorio.searchByExample( usuario ).head
		
		return usuarioEncontrado
		
	}

}
