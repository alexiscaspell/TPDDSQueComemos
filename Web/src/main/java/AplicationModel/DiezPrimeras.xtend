package AplicationModel

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DiezPrimeras {

	List<Receta> diezPrimeras = new ArrayList<Receta>;
	
	def List<Receta> diezPrimeras(List<Receta> lista) {
		if ( lista.size > 10 ){
			lista.reverse()
			diezPrimeras = lista.drop( lista.size - 10 ).toList	
			return diezPrimeras.reverse()
		}
		else return lista	
	
	}
	
}