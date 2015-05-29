package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.util.Map

class ConsultasXSexo implements Observador {
	
	private Map< Sexo, Integer > consultasXSexo
	
	
	override actualizar( UsuarioPosta usuario ) {
		
		// Buscar manera de agregar fuera de la funcion el par ( hombre, 0 ) y ( mujer, 0 )
		// if sexo hombre y mujer ya estan la lista 
		consultasXSexo.put( usuario.getSexo() , consultasXSexo.get( usuario.getSexo() ) + 1 )
		// else
		
	}
	
	
}