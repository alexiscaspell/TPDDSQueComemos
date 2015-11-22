package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.BaseEntity
import com.fasterxml.jackson.annotation.JsonIgnore
import java.util.HashSet
import java.util.Set

abstract class SujetoObservado extends BaseEntity {
	
	@JsonIgnore
	private Set<Observador> Observadores = new HashSet<Observador>()

	def void addObservador(Observador observador) {
		Observadores.add(observador)
	}

	def void removeObservador(Observador observador) {
		Observadores.remove(observador)
	}

	def Set<Observador> getObservadores() {
		Observadores
	}

	def void notificar()

}
