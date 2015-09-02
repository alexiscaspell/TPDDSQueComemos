package ar.edu.frba.utndds.grupo6.ui.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.RepoUsuarios
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class ControlLogin {
	
	RepoUsuarios repositorio
	
	String nickname
	
	String password
	
	new(RepoUsuarios repo) {
		
		repositorio = repo
	}
	
	def validarNickYContraseña(String string, String string2) {

		repositorio.validarNickYContraseña(string,string2)

	}
	
}