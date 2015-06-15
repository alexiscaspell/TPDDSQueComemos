package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.List

public class RepoUsuarios implements IRepoUsuarios{
	
	private List<Usuario> usuarios = new ArrayList<Usuario>()
	
	override add(Usuario usuario) {
		usuarios.add(usuario)
	}
	
	override remove(Usuario usuario) {
		usuarios.remove(usuarios)
	}
	
	override update(Usuario usuario) {
		val usuarioEncontrado = usuarios.findFirst[x | x.nombre.equals(usuario.nombre)]
		usuarios.remove(usuarioEncontrado)
		usuarios.add(usuario)
	}
	
	override get(Usuario usuario) {
		usuarios.findFirst[x | x.nombre.equals(usuario.nombre)]
	}
	
	def Usuario get(String nombre)
	{
		usuarios.findFirst[x | x.nombre.equals(nombre)]
	}
	
	override list(Usuario usuario) {
		
	}	
}