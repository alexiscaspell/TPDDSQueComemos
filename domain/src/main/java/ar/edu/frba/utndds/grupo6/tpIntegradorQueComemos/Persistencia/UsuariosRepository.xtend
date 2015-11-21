package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import org.bson.Document
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.util.Date

public class UsuariosRepository extends MongoDBRepository<Usuario> {

	new() {
		super("Usuario")
	}
	
	def List<Usuario> list(Usuario usuario) {
	}

	def List<Usuario> login(String name, String pass) {
	}
	
	// Hago el field collection publico para poder usarlo aca
	def Usuario searchByNickYPass(String nick, String pass) {
		var user = collection.findOne("{nickName: '"+nick+"'}").^as(getEntityType)
		if (user.password == pass)
		{
			return user;
		}
		return null;
	}
	
	override getEntityType() {
		return typeof(Usuario)
	}
	
}
