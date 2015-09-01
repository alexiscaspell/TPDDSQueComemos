package ar.edu.frba.utndds.grupo6.ui.AplicationModel

import org.uqbar.commons.utils.Observable
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ConsultasXRecetas
import java.util.Map
import java.awt.Color
import java.util.ArrayList

@Observable
@Accessors
class AplicationModel {	
	
	AlgoritmoReceta algoritmoReceta = new AlgoritmoReceta()
	Receta recetaSeleccionada
	List<Receta> resultados
	Map<String,Integer> consultas 
	List<Color> colores = new ArrayList<Color>
	int PosColor = -1

	new( ConsultasXRecetas consultas ) {
		this.consultas = consultas.estadistica
	}

	// Busca las recetas a mostrar del usuario 
	def void resultadosRecetas( Usuario usuario ) {
		
	
		// if perfilUsuario.login = primeraVez
		if ( false ) algoritmoReceta.aplicar( consultas )
			// perfilUsuario.login = No PrimeraVez
		else {	
			if ( usuario.favoritas == 0 ) resultados = usuario.consultas.subList(0,9)
			else resultados = usuario.favoritas
			}
		}
				
	def Receta getSeleccionada() {
		recetaSeleccionada 
	}
	
	def Color getColor() {
		PosColor++
		return colores.get(PosColor)
	}
	
	def ApilcarAlgoritmoColor( Usuario usuario ){
		resultados.forEach[
			if ( it.esPublica() )  colores.add(Color.red) 
			else if ( it.usuarioCreador == usuario )  colores.add(Color.blue) 
			else ( it.usuarioCreador.comparteGrupo( usuario ) )  colores.add(Color.green) 
		]
	}	
}