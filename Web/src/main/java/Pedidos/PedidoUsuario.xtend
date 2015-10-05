package Pedidos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PedidoUsuario {
	Usuario usuario;
	String color;
	
	new ( Usuario usuario ){	
		this.usuario = usuario
	}
	
	def Color(){
		if ( usuario.IMC > 30 ) color = "red"
		else if ( usuario.IMC < 18 ) color = "orange"
		else color = "green"
	}
}