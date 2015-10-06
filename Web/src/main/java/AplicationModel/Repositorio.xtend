package AplicationModel

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Login
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.RepoUsuarios
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente

@Accessors
class Repositorio {

	UsuarioTestBuilder usuarioBuilder = new UsuarioTestBuilder()

	RepoUsuarios repositorio = new RepoUsuarios()

	new() {

		var user1 = usuarioBuilder.usuarioBuilder("Lucas")
		user1.login = new Login("Lucas", "123")
		var user2 = usuarioBuilder.usuarioBuilder("Mariano")
		user1.login = new Login("Mariano", "456")

		repositorio.add(user1)
		repositorio.add(user2)
	}

	def getUsuario(String name) {
		println("[RepoUsuarios] getUsuario() de name = " + name)
		repositorio.get(name)
	}

	
}
