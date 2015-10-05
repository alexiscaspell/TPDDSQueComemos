package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Login {
	
	String nickName
	
	String password
	
	new(String nick, String pass) {
		
		nickName = nick
		
		password = pass
	}
	
}