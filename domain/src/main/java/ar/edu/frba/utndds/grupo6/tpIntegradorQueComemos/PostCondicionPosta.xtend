package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List

class PostCondicionPosta implements PostCondiciones {

	private PostCondiciones postCondicion

	def void setPostCondicion10Primeros() {
		postCondicion = new PostCondicion10Primeros()
	}

	def void setPostCondicionOrdenarXLetra() {
		postCondicion = new PostCondicionOrdenarXLetra()
	}

	def void setPostCondicionOrdenarXCalorias() {
		postCondicion = new PostCondicionOrdenarXCalorias()
	}

	def void setPostCondicionPares() {
		postCondicion = new PostCondicionPares()
	}

	override aplicarPostCondicion(List<Receta> recetas) {
		if(postCondicion != null) postCondicion.aplicarPostCondicion(recetas) else return recetas
	}

}
