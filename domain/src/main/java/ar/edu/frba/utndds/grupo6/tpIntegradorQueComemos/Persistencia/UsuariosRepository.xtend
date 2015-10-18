package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import org.hibernate.Criteria

class UsuariosRepository extends RepoDefault<Usuario> {
	
	static UsuariosRepository instance
	
	static def getInstance() {
		if (instance == null) {
			instance = new UsuariosRepository()
		}
		return instance
	}
	
	override getEntityType() {
		typeof( Usuario )
	}
	
	override addQueryByExample(Criteria criteria, Usuario t) {
		// Sobre que criteria se busca, habria un solo tipo de busqueda?
	}
}