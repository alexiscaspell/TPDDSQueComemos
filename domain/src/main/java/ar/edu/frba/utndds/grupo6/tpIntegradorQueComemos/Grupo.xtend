package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
public class Grupo implements Consumidor {

	private String nombre

	private List<Usuario> integrantes = new ArrayList<Usuario>()

	private List<Receta> recetasPreferidas = new ArrayList<Receta>()

	def contieneAlUsuario(Usuario usuario) {
		integrantes.contains(usuario)
	}

	override sePuedeSugerir(Receta receta) {
		puedeComer(receta) && esPreferida(receta)
	}

	def esPreferida(Receta receta) {
		return (receta.estaContenido(recetasPreferidas))
	}

	def puedeComer(Receta receta) {
		integrantes.forall[integrante|integrante.puedeComer(receta)]
	}

	def agregar(Usuario usuario) {
		integrantes.add(usuario)
		usuario.agregarGrupo(this)
	}
}
