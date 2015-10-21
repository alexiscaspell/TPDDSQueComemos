package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.Column

@Entity
@Accessors
class Login {
	
	@Id 
	@GeneratedValue
	private long id
	
	@Column ( length = 150 )
	String nickName
	
	@Column ( length = 150 )
	String password
	
	new(String nick, String pass) {
		
		nickName = nick
		
		password = pass
	}
	
	new(){
	}
	
}