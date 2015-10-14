package Pedidos

import queComemos.entrega3.dominio.Dificultad
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PedidoFiltroConsultaReceta {
	
	var String nombre
	
	var Dificultad dificultad
	
	var Ingrediente ingrediente
	
	var int maximoCalorias
	
	var int minimoCalorias
	
	var Temporada temporada
	
	var Boolean filtrosUsuario
	
}