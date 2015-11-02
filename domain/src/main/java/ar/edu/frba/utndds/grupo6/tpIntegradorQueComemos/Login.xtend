package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.Column

@Accessors
class Login {
	
	String nickName
	
	String password
	
	new(String nick, String pass) {
		
		nickName = nick
		
		password = pass
	}
	
	new(){
	}
	
}