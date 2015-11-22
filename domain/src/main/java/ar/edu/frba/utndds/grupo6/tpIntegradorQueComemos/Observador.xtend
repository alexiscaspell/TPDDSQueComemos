package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import com.fasterxml.jackson.annotation.JsonTypeInfo

@JsonTypeInfo(use=JsonTypeInfo.Id.CLASS, include=JsonTypeInfo.As.PROPERTY, property="@class")
//@JsonTypeInfo(use=JsonTypeInfo.Id.NAME, include=JsonTypeInfo.As.PROPERTY, property="type")
abstract class Observador {

	def void actualizar(Usuario usuario);

	def void reset();

}
