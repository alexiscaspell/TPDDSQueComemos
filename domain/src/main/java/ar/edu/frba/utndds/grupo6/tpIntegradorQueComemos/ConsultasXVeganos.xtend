package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import queComemos.entrega3.dominio.Dificultad
import javax.persistence.Entity
import javax.persistence.Column

@Entity
class ConsultasXVeganos extends Observador {

	@Column
	private int consultasXVeganos = 0

	override actualizar(Usuario usuario) {

		//if (usuario.getClass().getName() == "ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioVegano")
		if (usuario.esVegano()) {
			usuario.getConsultas().forEach [
				if (it.getDificultad() == Dificultad.DIFICIL) {
					consultasXVeganos++
				}
			]
		}
	}

	def int getEstadistica() {
		consultasXVeganos
	}

	override reset() {
		consultasXVeganos = 0
	}

}
