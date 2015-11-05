package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import com.mongodb.MongoClient
import com.mongodb.client.MongoCollection
import com.mongodb.client.MongoDatabase
import org.bson.Document
import java.util.List

public abstract class MongoDBRepository<T extends BaseEntity> {

	private MongoClient mongoClient;

	private MongoDatabase db;

	public MongoCollection<T> collection;

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
	
	def T findByName( String string ){
		collection.find ( new Document( "nombre", string ) ).head
	}
	
	def List<T> allInstances(){
		collection.find().toList
	}
	
	def abstract Class<T> getEntityType()
	
}
