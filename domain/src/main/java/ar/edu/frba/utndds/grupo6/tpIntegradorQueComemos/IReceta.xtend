package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import java.util.List
import java.util.Map
import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.Inheritance
import javax.persistence.InheritanceType
import javax.persistence.GenerationType

@Entity
@Inheritance ( strategy = InheritanceType.TABLE_PER_CLASS)
abstract class IReceta {
	
	@Id
	@GeneratedValue( strategy = GenerationType.TABLE )
	public long Id

	def int getCalorias()

	def String getExplicacion()

	def void validar()

	def List<Condicion> condicionesInadecuadas()

	def int cantidadDeAzucar()

	def Map<Ingrediente, Integer> getIngredientes()

	def Map<Condimento, Integer> getCondimentos()

	def void agregarSubReceta(IReceta receta)
}
