package ar.edu.frba.utndds.grupo6.ui.AplicationModel

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class DetalleReceta {

	private Receta receta;

	new(Receta receta) {
		this.receta = receta;
	}

	def Receta getReceta() {
		return receta;
	}

	def void setReceta(Receta receta) {
		this.receta = receta;
	}

	def String nombreReceta() {
		return this.receta.nombre
	}

	def String caloriasReceta() {
		return this.receta.calorias.toString() + " Calorías."
	}

	def String autorReceta() {
		return "Creado por " + this.receta.usuarioCreador
	}

	def String dificultadReceta() {
		return this.receta.dificultad.toString()
	}

	def temporadasReceta() {
		return this.receta.temporadas
	}

	def ingredientesReceta() {
		this.receta.ingredientes.keySet
	}

	def condimentosReceta() {
		this.receta.condimentos.keySet
	}

	def String explicacionReceta() {
		return this.receta.explicacion
	}

	def esFavorita() {

		//		return this.receta.usuarioCreador.favoritas.contains(receta)
		return true;
	}

	def condicionesPreexistentes() {
		return this.receta.condicionesInadecuadas
	}
}
