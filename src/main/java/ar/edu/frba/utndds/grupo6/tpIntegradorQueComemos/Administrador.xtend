package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import java.util.ArrayList
import java.util.List

class Administrador{
	
	private RepoUsuarios repoUsuario
	private List<Usuario> colaDeEspera = new ArrayList<Usuario>()
	
	def void aceptarUsuario(Usuario usuario){
		repoUsuario.add(usuario)
		colaDeEspera.remove(usuario)		
	}
	
	def void rechazarUsuario(Usuario usuario, String motivoDeRechazo){
		colaDeEspera.remove(usuario)
		//usuario.enviarMotivoDeRechazo(motivo)
	}
	
	public def void agregarSolicitud(Usuario usuario){		
		colaDeEspera.add(usuario)
	}
	
}