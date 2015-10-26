package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.Inheritance
import javax.persistence.InheritanceType
import javax.persistence.GenerationType

@Entity
@Inheritance ( strategy = InheritanceType.TABLE_PER_CLASS)
abstract class Observador {

	@Id
	@GeneratedValue  ( strategy = GenerationType.TABLE )
	private long id

	def void actualizar(Usuario usuario);

	def void reset();
	
	
}
