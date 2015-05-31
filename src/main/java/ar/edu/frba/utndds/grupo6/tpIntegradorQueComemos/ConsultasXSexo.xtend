package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.util.Map

class ConsultasXSexo implements Observador {
	
	private Map< Sexo, Integer > consultasXFemenino
	private Map< Sexo, Integer > consultasXMasculino
	
	
	override actualizar( UsuarioPosta usuario ) {	
		//if  ( ! consultasXSexo.containsKey( Sexo.MASCULINO) ) consultasXSexo.put( Sexo.MASCULINO, 0 )
		//if  ( ! consultasXSexo.containsKey( Sexo.FEMENINO) ) consultasXSexo.put( Sexo.FEMENINO, 0 )
		//consultasXSexo.put( usuario.getSexo() , consultasXSexo.get( usuario.getSexo() ) + 1 )		
	}	
}