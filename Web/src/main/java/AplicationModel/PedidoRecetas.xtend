package AplicationModel

import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConAzucar
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import queComemos.entrega3.dominio.Dificultad
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada

@Accessors
class PedidoRecetas {

	String mostrando;
	List<Receta> recetas = new ArrayList<Receta>();
	UsuarioPosta usuario;
	val temporadas = new ArrayList<Temporada>();
	Integer i = 0; // Eliminar! se usa para hardcodear solo una vez
	new( UsuarioPosta usuario ){
		this.usuario = usuario
		
		// Cambiar el usuarioPosta de parametro por un usuario 
		// ( Es necesario el usuarioPosta para poder llamar a marcarComoFavorita y hardcodear las recetas ) 
		// AGREGAR USUARIO COMO PARAMETRO DE NEW Y SACAR EL HARDCODEADO
	}
	
	
	
	def hardcodeRecetas(){
		if ( i == 0 ) {
			var Receta receta1 = new Receta
			var Receta receta2 = new Receta
			receta1.nombre = "PAPA"
			receta2.nombre = "Carne"
			receta1.dificultad = Dificultad.FACIL
			receta2.dificultad = Dificultad.MEDIANA
			receta1.calorias = 500
			receta2.calorias = 250
			
			temporadas.add(Temporada.INVIERNO)
			temporadas.add(Temporada.OTONIO)
			temporadas.add(Temporada.PRIMAVERA)
			temporadas.add(Temporada.VERANO)
				
			receta1.temporadas = temporadas
			usuario.marcarComoFavorita( receta1 )
			
			temporadas.remove(Temporada.INVIERNO)
			temporadas.remove(Temporada.OTONIO)
			receta2.temporadas = temporadas
			usuario.marcarComoFavorita( receta2 )
			i++
			}
		}
	
	def setRecetas(){
		hardcodeRecetas()
		// If de primer Login
		if ( usuario.favoritas == 0 ) {
			mostrando = "Tus ultimas Recetas Consultadas"
			// recetas = ultimas consultas
		}
		else {
			mostrando = "Tus Recetas Favoritas"
			usuario.favoritas.forEach[ recetas.add( it )]
			 	
		} 
	}
}