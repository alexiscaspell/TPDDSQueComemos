package Pedidos

import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import AplicationModel.DiezPrimeras

@Accessors
class PedidoRecetas {

	String mostrando;
	List<Receta> recetas = new ArrayList<Receta>();
	Usuario usuario;
	DiezPrimeras diezPrimeras = new DiezPrimeras();
	val temporadas = new ArrayList<Temporada>();
	new( Usuario usuario ){
			this.usuario = usuario
		}
		
	
	def setRecetas(){
		// If de primer Login
		if ( usuario.favoritas == 0 ) {
			mostrando = "Tus ultimas Recetas Consultadas"
			recetas = diezPrimeras.diezPrimeras( usuario.getConsultas() )
		}
		else {
			mostrando = "Tus Recetas Favoritas"
			recetas = diezPrimeras.diezPrimeras( usuario.favoritas ) 	
		} 
	}
	
}