package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UsuarioVegano extends UsuarioDecorator {

	new(Usuario decorado) {
		super(decorado)
	}

	override estadoRutina() {
		//Ver si se hace un enum con las posibles preferencias alimenticias
		if (this.preferenciasAlimenticias.contains("Frutas")) {
			decorado.estadoRutina()
		} else {
			throw new RutinaNoSaludableExc()
		}
	}

	override cumpleCondicion() {
		return !(decorado.preferenciasAlimenticias.contains(Ingrediente.POLLO) ||
			decorado.preferenciasAlimenticias.contains(Ingrediente.CARNE) || decorado.preferenciasAlimenticias.contains(Ingrediente.CHIVITO) ||
			decorado.preferenciasAlimenticias.contains(Ingrediente.CHORI))
			
	}

}
