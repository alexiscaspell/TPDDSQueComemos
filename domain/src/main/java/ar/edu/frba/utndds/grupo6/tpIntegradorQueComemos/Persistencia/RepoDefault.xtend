package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import java.util.List

abstract class RepoDefault<T> {

	def List<T> allInstances() {
	}

	def List<T> searchByExample(T t) {
	}

	def List<T> searchByName(String name) {
	}

	def void reset() {
	}

	def void destroy(T t) {
	}

	def void create(T t) {
	}

	def void update(T t) {
	}

	def abstract Class<T> getEntityType()
}
