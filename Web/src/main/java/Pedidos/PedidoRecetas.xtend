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
	boolean isHome = true;
	PedidoMonitoreo pedidoMonitoreo = new PedidoMonitoreo()
	List<Integer> cantidadConsultas = new ArrayList<Integer>();
	
	
	new(Usuario usuario) {
		this.usuario = usuario
	}

	def setRecetas() {
		// If de primer Login ( cambiar false cuando este termiando el login )
		if ( false ) {
			pedidoMonitoreo.masConsultadas
			recetas = pedidoMonitoreo.recetas
			cantidadConsultas = pedidoMonitoreo.cantidadConsultas
			mostrando = "Las 10 recetas mas consultadas"
			isHome = false
		} else {
			if (usuario.favoritas.size == 0) {
				mostrando = "Tus ultimas Recetas Consultadas"
				recetas = diezPrimeras.diezPrimeras(usuario.getConsultas())
			} else {
				mostrando = "Tus Recetas Favoritas"
				recetas = diezPrimeras.diezPrimeras(usuario.favoritas.toList)
			}
		}
		
		
	}

}
