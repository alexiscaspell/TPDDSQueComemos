package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import org.hibernate.Criteria
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta

class RecetasRepository extends RepoDefault<Receta> {
	
	static RecetasRepository instance
	
	static def getInstance() {
		if (instance == null) {
			instance = new RecetasRepository()
		}
		return instance
	}
	
	override getEntityType() {
		typeof( Receta )
	}
	
	override addQueryByExample(Criteria criteria, Receta t) {
		// Sobre que criteria se busca, habria un solo tipo de busqueda?
	}
	
}