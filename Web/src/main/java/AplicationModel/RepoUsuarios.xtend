package AplicationModel

import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoUsuarios {
	
	List<UsuarioPosta> usuarios = new ArrayList<UsuarioPosta>
	UsuarioTestBuilder usuarioBuilder = new UsuarioTestBuilder()
	
	
	new(){		
		usuarios.add( usuarioBuilder.usuarioBuilder( "Lucas" ) )
		usuarios.add( usuarioBuilder.usuarioBuilder( "Mariano" ) )
	}
	
	def getUsuario( String name ){
		println( "[RepoUsuarios] getUsuario() de name = " + name)
		usuarios.findFirst[ it.nombre == name ]
	}
	

}