package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import javax.persistence.Entity
import javax.persistence.Column
import javax.persistence.OneToMany
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.ManyToMany

@Accessors
@Entity
public class Grupo implements Consumidor {
	
	@Id
	@GeneratedValue
	private long id

	@Column ( length = 150 )
	private String nombre

	// ManyToMany ?
	@ManyToMany 
	private List<Usuario> integrantes = new ArrayList<Usuario>()

	@OneToMany ( fetch = FetchType.EAGER ) // verificar si es EAGER o Lazy
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
