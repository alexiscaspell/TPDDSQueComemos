package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import com.mongodb.MongoClient
import com.mongodb.client.MongoCollection
import com.mongodb.client.MongoDatabase
import org.bson.Document

public abstract class MongoDBRepository<T extends BaseEntity> {

	private MongoClient mongoClient;

	private MongoDatabase db;

	private MongoCollection<T> collection;

	new(String className) {
		mongoClient = new MongoClient();
		db = mongoClient.getDatabase("QueComemosDB");
		collection = db.getCollection(className, getEntityType)
	}

	def create(T object) {
		collection.insertOne(object);
	}

	def delete(T object) {
		collection.deleteOne(new Document("id", object.id))
	}
	
	def update(T object) {
		collection.replaceOne(new Document("id", object.id), object)
	}

	def abstract Class<T> getEntityType()
}
