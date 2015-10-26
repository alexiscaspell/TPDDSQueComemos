package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.List
import javax.persistence.Entity
import org.hibernate.annotations.CollectionOfElements
import org.hibernate.annotations.Fetch
import org.hibernate.annotations.FetchMode
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.CascadeType
import javax.persistence.OneToMany
import javax.persistence.GenerationType
import javax.persistence.Inheritance
import javax.persistence.InheritanceType

@Entity
@Inheritance ( strategy = InheritanceType.TABLE_PER_CLASS)
abstract class SujetoObservado {

	@Id
	@GeneratedValue ( strategy = GenerationType.TABLE )
	public long id

	@OneToMany ( fetch = FetchType.EAGER, cascade = CascadeType.ALL )
	@Fetch(value = FetchMode.SUBSELECT)
	private List<Observador> Observadores = new ArrayList<Observador>()

	def void addObservador(Observador observador) {
		Observadores.add(observador)
	}

	def void removeObservador(Observador observador) {
		Observadores.remove(observador)
	}

	def List<Observador> getObservadores() {
		Observadores
	}

	def void notificar()

}
