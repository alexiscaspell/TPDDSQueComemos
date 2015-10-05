package AplicationModel

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConAzucar
import queComemos.entrega3.dominio.Dificultad
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import java.util.ArrayList
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ConsultasXRecetas
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Recetario

@Accessors
class Dependencias {
	public static val repoUsuarios = new Repositorio()
	public static val repoRecetas = Recetario.getInstance()
	public static Usuario usuario_aux
	public static recetaConAzucar recetaAzucar = new recetaConAzucar()
	val static temporadas = new ArrayList<Temporada>();
	public static ConsultasXRecetas consultasXRecetas =  new ConsultasXRecetas()
	
	public static def hardcodear(){
		
		
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
		//temporadas.add(Temporada.VERANO)
			
		receta1.temporadas = temporadas
		usuario_aux.marcarComoFavorita( receta1 )
		
		temporadas.remove(Temporada.INVIERNO)
		temporadas.remove(Temporada.OTONIO)
		receta2.temporadas = temporadas

		usuario_aux.addObservador( consultasXRecetas )
		usuario_aux.marcarComoFavorita( receta2 )
	}
}