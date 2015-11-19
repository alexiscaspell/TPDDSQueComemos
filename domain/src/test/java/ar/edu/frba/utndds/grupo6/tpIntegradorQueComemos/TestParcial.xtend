package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import com.mongodb.DB
import com.mongodb.Mongo
import org.junit.Test
import org.mongojack.JacksonDBCollection

class MongoTest {

	@Test
	def guardarUsuario() {
		var mongo = new Mongo()
		var database = new DB(mongo, "TestJackson")
		var collection = database.getCollection("Clases")
		var coll = JacksonDBCollection.wrap(collection, typeof(Usuario), typeof(String));
		var usuario = new UsuarioPosta()
		var result = coll.insert(usuario);
		var id = result.getSavedId();
		var savedObject = result.getSavedObject();
	}
}
