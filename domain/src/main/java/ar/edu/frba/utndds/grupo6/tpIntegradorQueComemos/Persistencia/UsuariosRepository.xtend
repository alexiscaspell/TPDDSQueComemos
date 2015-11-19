package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import com.mongodb.MongoClient
import java.util.Date
import java.util.List
import org.bson.Document
import org.mongodb.morphia.Morphia
import org.mongodb.morphia.Datastore

public class UsuariosRepository {
	
	private MongoClient mongoClient;
	private Datastore ds;

	new(){
//		mongoClient = new MongoClient();
//		ds = new Morphia().createDatastore(mongoClient, "QueComemosDB")
//		ds.ensureIndexes();
//		ds.ensureCaps();
	}
	def List<Usuario> list(Usuario usuario) {
	}

	def List<Usuario> login(String name, String pass) {
	}

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
	//	def Usuario searchByNickYPass(String nick, String pass) {
	//		var document = new Document
	//		document.append("nickName", nick)
	//		document.append("password", pass)
	////		collection.find( document ).head
	//	}
	def create(Usuario usuario) {
		
		ds.save(usuario);
		
	}
	
}
