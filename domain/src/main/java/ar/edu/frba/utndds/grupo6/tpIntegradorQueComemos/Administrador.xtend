package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import java.util.ArrayList
import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.UsuariosRepository
import javax.persistence.Entity
import javax.persistence.OneToMany
import org.hibernate.annotations.LazyCollection
import org.hibernate.annotations.LazyCollectionOption
import javax.persistence.GeneratedValue
import javax.persistence.Id

class Administrador {

	private List<Usuario> colaDeEspera = new ArrayList<Usuario>()

	def void aceptarUsuario(Usuario usuario) {

		colaDeEspera.remove(usuario)

		UsuariosRepository.getInstance().create(usuario)

	}

	def void rechazarUsuario(Usuario usuario, String motivoDeRechazo) {

		colaDeEspera.remove(usuario)

	//usuario.enviarMotivoDeRechazo(motivo)
	}

	public def void agregarSolicitud(Usuario usuario) {

		colaDeEspera.add(usuario)

	}

}
