package AplicationModel

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import java.util.ArrayList
import java.util.List

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConAzucar
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaValida
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConSal
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConCarne
import org.eclipse.xtend.lib.annotations.Accessors

class ListadoRecetas {
	
	@Accessors
	List<Receta> recetas = new ArrayList<Receta>;
	UsuarioTestBuilder usuarioBuilder = new UsuarioTestBuilder();
	Usuario usuario = usuarioBuilder.usuarioBuilder;
	
	recetaValida recetaEsValida = new recetaValida()
	recetaConAzucar recetaAzucar = new recetaConAzucar()
	recetaConSal recetaSal = new recetaConSal()
	recetaConCarne recetaCarne = new recetaConCarne()
			
	new( ){
		
		recetas.add( recetaAzucar.cumple( usuario ) )
 		recetas.add( recetaAzucar.noCumple( usuario ) )
 		recetas.add( recetaSal.cumple( usuario ) )
 		recetas.add( recetaSal.noCumple( usuario ) )
 		recetas.add( recetaCarne.cumple( usuario ) )
 		recetas.add( recetaCarne.noCumple( usuario ) )
	}
}