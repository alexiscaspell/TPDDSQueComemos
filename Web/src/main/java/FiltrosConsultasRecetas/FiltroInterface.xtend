package FiltrosConsultasRecetas

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta

interface FiltroInterface {
		
	def Boolean cumple(Receta receta)
}