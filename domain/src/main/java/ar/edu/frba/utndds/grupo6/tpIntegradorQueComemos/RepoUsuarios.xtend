package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

public class RepoUsuarios implements IRepoUsuarios {
	

	private List<Usuario> listaUsuarios = new ArrayList<Usuario>()

	public def Boolean existe(Usuario usuario) {

		listaUsuarios.contains(usuario)
	}

	override add(Usuario usuario) {
		listaUsuarios.add(usuario)
	}

	override remove(Usuario usuario) {
		listaUsuarios.remove(listaUsuarios)
	}

	override update(Usuario usuario) {
		val usuarioEncontrado = get(usuario)

		listaUsuarios.remove(usuarioEncontrado)

		listaUsuarios.add(usuario)
	}

	override get(Usuario usuario) {
		listaUsuarios.findFirst[x|x.nombre.equals(usuario.nombre)]
	}

	def Usuario get(String nombre) {
		listaUsuarios.findFirst[x|x.nombre.equals(nombre)]
	}

	public override List<Usuario> list(Usuario usuario) {
		val listaUsuariosConElMismoNombre = listaUsuarios.filter[x|x.nombre.equals(usuario.nombre)].toList()

		return listaUsuariosConElMismoNombre.filter[usuarioFiltrado|usuarioFiltrado.cumpleMismasCondiciones(usuario)].toList
	}
	
	def validarNickYContraseña(String nick,String pass){
		
		val Usuario usuarioCorrecto = listaUsuarios.findFirst[usuario|usuario.nickName.equals(nick)&&usuario.password.equals(pass)]
		
		return usuarioCorrecto
	}
}
