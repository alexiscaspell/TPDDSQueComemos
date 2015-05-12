package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

public class Grupo implements Consumidor {
	
	@Accessors
	private String nombre
	
	@Accessors
	private List<Usuario> integrantes
	
	@Accessors
	private List<Receta> recetasPreferidas 
	
	new(List<Usuario> usuarios, List<Receta> recetasPreferidas)
	{
		integrantes = usuarios		
		this.recetasPreferidas= recetasPreferidas
	}
	
	def contieneAlUsuario(Usuario usuario) {
		integrantes.contains(usuario)
	}
	
	override sePuedeSugerir(Receta receta){		
		puedeComer(receta)&&esPreferida(receta)		
	}
	
	def esPreferida(Receta receta){
		return(recetasPreferidas.contains(receta))		
	}
	
	def puedeComer(Receta receta) {		
		integrantes.forall[integrante|integrante.puedeComer(receta)]
	}
}