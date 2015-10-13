package AplicationModel

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Login
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.RepoUsuarios
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario

@Accessors
class Repositorio {

	UsuarioTestBuilder usuarioBuilder = new UsuarioTestBuilder()

	RepoUsuarios repositorio = new RepoUsuarios()

	new() {
		var user1 = usuarioBuilder.usuarioBuilder("Lucas")
		//user1.login = new Login("Lucas", "123")
		user1.nickName = "Lucas"
		user1.password = "123"
		var user2 = usuarioBuilder.usuarioBuilder("Mariano")
		//user1.login = new Login("Mariano", "456")
		user2.nickName = "Mariano"
		user2.password = "456"

		repositorio.add(user1)
		repositorio.add(user2)
	}

	def getUsuario(String name) {
		println("[RepoUsuarios] getUsuario() de name = " + name)
		repositorio.get(name)
	}
	
	def loguear(String name,String pass){

		val Usuario usuarioEncontrado = repositorio.validarNickYContraseña(name,pass)
		
		return usuarioEncontrado
		
	}

}
