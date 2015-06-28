package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
public class ResultadoConsulta {
	
	private Receta recetaModelo;
	
	private List<Receta> recetasEncontradas;
	
	private Usuario usuario;
	
	new (Receta receta, List<Receta> recetas, Usuario usuario)
	{
		this.recetaModelo = receta;
		this.recetasEncontradas = recetas;
		this.usuario = usuario;
	}	
}