package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

class Administrador {

	@Accessors
	private RepoUsuarios repoUsuario

	private List<Usuario> colaDeEspera = new ArrayList<Usuario>()

	def void aceptarUsuario(Usuario usuario) {

		colaDeEspera.remove(usuario)

		repoUsuario.add(usuario)

	}

	def void rechazarUsuario(Usuario usuario, String motivoDeRechazo) {

		colaDeEspera.remove(usuario)

	//usuario.enviarMotivoDeRechazo(motivo)
	}

	public def void agregarSolicitud(Usuario usuario) {

		colaDeEspera.add(usuario)

	}

}
