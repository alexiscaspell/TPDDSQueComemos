package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import org.mongojack.JacksonDBCollection
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.Clase
import com.mongodb.DBCollection
import com.mongodb.MongoClient
import com.mongodb.client.MongoDatabase
import com.mongodb.DB
import com.mongodb.Mongo

class MongoTest {

	@Test
	def guardarUsuario() {
		var mongo = new Mongo()
		var database = new DB(mongo, "TestJackson")
		var collection = database.getCollection("Clases")
		var coll = JacksonDBCollection.wrap(collection, typeof(Clase), typeof(String));
		var entity = new Clase()
		var result = coll.insert(entity);
		var id = result.getSavedId();
		var savedObject = result.getSavedObject();
	}
}
