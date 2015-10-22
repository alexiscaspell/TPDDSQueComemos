package Pedidos

import queComemos.entrega3.dominio.Dificultad
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PedidoEnumsSistema {
	
	var List<Temporada> temporadasDelSistema 
	
	var List<Dificultad> dificultadesDelSistema
	
	def hardcodearTemporadas() {
		temporadasDelSistema = new ArrayList<Temporada>
		temporadasDelSistema.add(Temporada.PRIMAVERA)
		temporadasDelSistema.add(Temporada.INVIERNO)
		temporadasDelSistema.add(Temporada.OTONIO)
		temporadasDelSistema.add(Temporada.VERANO)		
	}
	
		def hardcodearDificultades() {
		dificultadesDelSistema = new ArrayList<Dificultad>
		dificultadesDelSistema.add(Dificultad.DIFICIL)
		dificultadesDelSistema.add(Dificultad.FACIL)
		dificultadesDelSistema.add(Dificultad.MEDIANA)
	}
	
	def hardcodear(){
		hardcodearDificultades()
		hardcodearTemporadas()	
	}
}