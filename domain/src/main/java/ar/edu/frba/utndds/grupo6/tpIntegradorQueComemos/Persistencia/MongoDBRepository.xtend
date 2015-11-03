package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import com.mongodb.MongoClient
import com.mongodb.client.MongoDatabase;

public class MongoDBRepository<T> {	
	
	private MongoClient mongoClient;
	
	private MongoDatabase db;
	
	new(){
		mongoClient = new MongoClient();
		db = mongoClient.getDatabase("QueComemosDB");
	}
	
}