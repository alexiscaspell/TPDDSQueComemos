package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia


import com.fasterxml.jackson.annotation.JsonProperty
import org.mongojack.ObjectId

class Clase {
	
	private String id;

	@ObjectId
	@JsonProperty("_id")
	def String getId() {
		return id;
	}

	@ObjectId
	@JsonProperty("_id")
	def void setId(String id) {
		this.id = id;
	}
}
