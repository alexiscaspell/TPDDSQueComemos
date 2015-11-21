package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import org.bson.types.ObjectId
import org.eclipse.xtend.lib.annotations.Accessors
import org.jongo.marshall.jackson.oid.Id

@Accessors
public class BaseEntity {
	
	
	//@JsonProperty("_id")
	//@MongoId
	//private String _id;
	@Id
	private ObjectId _id;
}