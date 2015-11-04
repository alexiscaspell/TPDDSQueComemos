package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import java.util.List

public class UsuariosRepository extends MongoDBRepository<Usuario> {

	new(String className) {
		super(className)
	}
	
	override getEntityType() {
		typeof(Usuario)
	}

	def List<Usuario> list(Usuario usuario) {
	}

	def List<Usuario> login(String name, String pass) {
	}
	
	def Usuario FindBy(String string) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
