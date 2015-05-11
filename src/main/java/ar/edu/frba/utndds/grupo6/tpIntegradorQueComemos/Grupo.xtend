package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

public class Grupo {
	
	@Accessors
	private String nombre
	
	@Accessors
	private List<Usuario> usuarios
	
	@Accessors
	private List<String> preferenciasAlimenticias
	
	new(List<Usuario> usuarios, List<String> preferenciasAlimenticias)
	{
		this.usuarios = usuarios		
		this.preferenciasAlimenticias = preferenciasAlimenticias
	}
	
	def contieneAlUsuario(Usuario usuario) {
		usuarios.contains(usuario)
	}
	
}