package FiltrosConsultasRecetas

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta

class FiltroFiltrosUsuario implements FiltroInterface{
	
	private var Usuario usuario
	
	new(Usuario usuario) {

		this.usuario = usuario
	}
	
		override cumple(Receta receta) {
			
			usuario.cumpleCondicion(receta)
					
		}

	
	
}