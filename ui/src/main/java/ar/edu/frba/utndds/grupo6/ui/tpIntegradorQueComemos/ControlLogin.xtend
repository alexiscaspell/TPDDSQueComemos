package ar.edu.frba.utndds.grupo6.ui.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.UsuariosRepository

@Accessors
@Observable
class ControlLogin {

	UsuariosRepository repositorio

	String nickname

	String password

	new(UsuariosRepository repo) {

		repositorio = repo
	}

	def validarNickYContraseña(String string, String string2) {
		repositorio.searchByNickYPass(string, string2)
	}
}
