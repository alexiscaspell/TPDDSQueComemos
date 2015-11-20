package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import java.util.ArrayList
import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.UsuariosRepository

class Administrador {

	private List<Usuario> colaDeEspera = new ArrayList<Usuario>()

	def void aceptarUsuario(Usuario usuario) {

		colaDeEspera.remove(usuario)

		new UsuariosRepository("Usuario").create(usuario)
	}

	def void rechazarUsuario(Usuario usuario, String motivoDeRechazo) {

		colaDeEspera.remove(usuario)
	}

	public def void agregarSolicitud(Usuario usuario) {

		colaDeEspera.add(usuario)

	}

}
