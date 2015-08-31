package ar.edu.frba.utndds.grupo6.ui.AplicationModel

import org.uqbar.commons.utils.Observable
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class AplicationModel {
	
	
	
	List<Receta> resultados

	// Busca las recetas a mostrar del usuario 
	def void resultadosRecetas( Usuario usuario ){
		resultados = new ArrayList<Receta>
		
		// If ( x ) recetasFavoritas / recetasConsultadas / recetasPopulares
		resultados = usuario.favoritas
		
	}
	
}