package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import com.mongodb.DB
import com.mongodb.Mongo
import java.util.ArrayList
import java.util.List
import org.jongo.Jongo
import org.jongo.MongoCollection

public abstract class MongoDBRepository<T extends BaseEntity> {

	private Mongo mongo;

	private DB database;
	
	private Jongo jongo;

	public MongoCollection collection;

	new(String className) {
		mongo = new Mongo()
		database = new DB(mongo, "QueComemosDB")
		jongo = new Jongo(database);
		collection = jongo.getCollection(className)
	}

	def create(T object) {
		collection.save(object);
	}

	def delete(T object) {
		collection.remove("{_id: '"+ object._id +"'}");
	}

	def update(T object) {
		collection.save(object);
	}

	def T findByName(String string) {
		collection.findOne("{nombre: '"+string+"'}").^as(getEntityType)
	}

	def List<T> allInstances() {
		var list = new ArrayList<T>()
		var results = collection.find("{}").^as(getEntityType)
		
		while(results.hasNext())
		{
			var result = results.next();
			list.add(result)
		}
		
		return list;
	}

	def abstract Class<T> getEntityType()

}
