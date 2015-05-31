package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.util.Map

class ConsultasXSexo implements Observador {
	
	private Map< String, Integer > consultasXFemenino
	private Map< String, Integer > consultasXMasculino
	
	
	override actualizar( UsuarioPosta usuario ) {
		usuario.getConsultas().forEach[
			if ( ! consultasXFemenino.containsKey( it.nombre )) consultasXFemenino.put( it.nombre, 0 )
			if ( ! consultasXMasculino.containsKey( it.nombre )) consultasXMasculino.put( it.nombre, 0 )
			if ( usuario.sexo == Sexo.FEMENINO ){	
				consultasXFemenino.put( it.nombre , consultasXFemenino.get( it.nombre ) + 1)
			} else  consultasXMasculino.put( it.nombre , consultasXMasculino.get( it.nombre ) + 1)
			]	
		}	
}