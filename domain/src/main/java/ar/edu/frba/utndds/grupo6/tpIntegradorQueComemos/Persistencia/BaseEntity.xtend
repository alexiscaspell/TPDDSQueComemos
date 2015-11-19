package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import org.eclipse.xtend.lib.annotations.Accessors
import com.mongodb.BasicDBObject

public class BaseEntity extends BasicDBObject {
	
	@Accessors	
	private String id
	
	@Accessors
	private String nombre1
}