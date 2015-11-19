package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import com.fasterxml.jackson.annotation.JsonTypeInfo
import com.fasterxml.jackson.annotation.JsonSubTypes

@JsonTypeInfo(use=JsonTypeInfo.Id.NAME, include=JsonTypeInfo.As.PROPERTY, property="_class")
@JsonSubTypes(@JsonSubTypes.Type(value=typeof(Perro), name="Perro"),
	@JsonSubTypes.Type(value=typeof(Gato), name="Gato")
)
public abstract class Animal {
	
	public String _id;
	
	def String obtenerNombre()
}