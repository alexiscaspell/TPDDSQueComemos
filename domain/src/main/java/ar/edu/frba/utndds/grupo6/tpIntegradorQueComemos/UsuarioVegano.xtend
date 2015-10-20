package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.RecetasRepository
import javax.persistence.Entity

@Entity
class UsuarioVegano extends UsuarioDecorator {
	new(Usuario decorado) {
		super(decorado)
		decorado.condicion.add( Condicion.VEGANO )
	}

	new(){
	}

	override estadoRutina() {
		return (decorado.preferenciasAlimenticias.exists[ingrediente|ingrediente.contieneFruta()] &&
			decorado.estadoRutina())
	}

	override usuarioValido() {
		return (!decorado.getPreferenciasAlimenticias().exists[ingrediente|ingrediente.contieneCarne()] &&
			decorado.usuarioValido())

	}

	override cumpleCondicion(Receta receta) {
		return ((receta.ingredientes.filter[condimento, cantidad|condimento.contieneCarne()].size() == 0))
	}

	override notificar() {
		getObservadores().forEach[actualizar(this)]
	}

	override getRecetasConAcceso() {
		val recetario = RecetasRepository.getInstance();
		val recetas = recetario.allInstances();
		consultas.clear()

		recetas.forEach [ receta |
			if (receta.puedeVer(this)) {
				consultas.add(receta)
			}
		]

		notificar()
		return consultas
	}

	override esVegano() {
		return true;
	}

	override esHipertenso() {
		return false || decorado.esHipertenso();
	}

	override esDiabetico() {
		return false || decorado.esDiabetico();
	}

	override cumpleMismasCondiciones(Usuario usuario) {

		usuario.esVegano() && decorado.cumpleMismasCondiciones(usuario)
	}

	override crearPerfil() {

		val UsuarioVegano usuarioCopia = new UsuarioVegano(decorado.crearPerfil)

		return usuarioCopia
	}

	override getRecetasBuscadasFavoritas() {
	}

}
