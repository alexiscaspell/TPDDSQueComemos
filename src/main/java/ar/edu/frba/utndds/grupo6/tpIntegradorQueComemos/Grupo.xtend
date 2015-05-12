package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

public class Grupo {
	
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
	
	def sePuedeSugerir(Receta receta){
		
		return(puedeComer(receta)&&esPreferida(receta))		
	}
	def esPreferida(Receta receta){
		return(recetasPreferidas.contains(receta))		
	}
	
	def puedeComer(Receta receta){
		
		return(integrantes.forall[integrante|integrante.puedeComer(receta)])
	}
}