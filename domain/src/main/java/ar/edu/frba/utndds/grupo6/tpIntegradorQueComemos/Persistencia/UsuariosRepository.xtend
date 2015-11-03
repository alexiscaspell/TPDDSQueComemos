package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import java.util.List

class UsuariosRepository extends RepoDefault<Usuario> {

	private static UsuariosRepository instance

	static def getInstance() {
		if (instance == null) {
			instance = new UsuariosRepository()
		}
		return instance
	}

	override getEntityType() {
		typeof(Usuario)
	}

	def existe(Usuario usuario) {
		! searchByName(usuario.nombre).empty
	}

	def List<Usuario> list(Usuario usuario) {

		val listaUsuariosConElMismoNombre = searchByName(usuario.nombre)
		return listaUsuariosConElMismoNombre.filter[usuarioFiltrado|usuarioFiltrado.cumpleMismasCondiciones(usuario)].
			toList
	}

	def List<Usuario> login(String name, String pass) 
	{
	}
}
