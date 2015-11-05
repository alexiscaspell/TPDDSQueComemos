package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import org.bson.Document
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.util.Date

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

	/* // el find de Mongo no estaria devolviendo un documento ? 
	def Usuario getUsuario( String string ) {
		UsuarioFromJson( findByName( string ).head )	
	} */
	// COMO DIFERENCIAR QUE USUARIO ES ?
	def Usuario UsuarioFromJson(Document usuarioJSON) {
		new UsuarioPosta(
			usuarioJSON.get("peso") as Double,
			usuarioJSON.get("altura") as Double,
			usuarioJSON.get("rutina") as Rutina,
			usuarioJSON.get("nombre") as String,
			usuarioJSON.get("sexo") as Sexo,
			usuarioJSON.get("fechaNacimiento") as Date
		)
	}
	
	// Hago el field collection publico para poder usarlo aca
	def Usuario searchByNickYPass(String nick, String pass) {
		var document = new Document
		document.append("nickName", nick)
		document.append("password", pass)
		collection.find( document ).head
	}
}
