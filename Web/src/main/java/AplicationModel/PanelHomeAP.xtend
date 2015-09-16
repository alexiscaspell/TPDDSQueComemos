package AplicationModel

import org.uqbar.commons.utils.Observable
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Map
import java.util.ArrayList

@Observable
@Accessors
class AplicationModel {

	AlgoritmoReceta algoritmoReceta = new AlgoritmoReceta()
	Receta recetaSeleccionada
	String RecetasMostradas
	List<Receta> resultados
	Map<String, Integer> consultas
	List<Receta> diezUltimas = new ArrayList<Receta>

	new(Map<String, Integer> map) {
		this.consultas = map
	}

	// Busca las recetas a mostrar del usuario 
	def void resultadosRecetas(Usuario usuario) {

		// if perfilUsuario.login = primeraVez
		if (false) {		
			//resultados = diezUltimas(algoritmoReceta.aplicar(consultas))
			RecetasMostradas = "Recetas Mas Consultadas en Que Comemos? son : "

		// perfilUsuario.login = No PrimeraVez	
		} else {
			if (usuario.favoritas == 0) {
				resultados = diezUltimas(usuario.getConsultas())
				RecetasMostradas = "Tus ultimas Recetas Consultadas son : "
			} else {
				RecetasMostradas = "Tus Recetas Favoritas son : "
				resultados = diezUltimas(usuario.favoritas)

			}

		}

	}

	def Receta getSeleccionada() {
		recetaSeleccionada
	}

	def List<Receta> diezUltimas(List<Receta> lista) {
		(0 .. lista.size - 1).forEach[if(it > (lista.size - 10 )) diezUltimas.add(lista.get(it))]
		return diezUltimas
	}

}
