package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.RecetasRepository

class UsuarioHipertenso extends UsuarioDecorator {
	new(Usuario decorado) {
		super(decorado)
		decorado.condicion.add( Condicion.HIPERTENSO )
	}

	override estadoRutina() {

		// Rutina saludable si tiene una rutina activa con ejercicio Adicional
		return (decorado.getRutina().rutinaActivaConEjercicioAdicional() && decorado.estadoRutina())
	}

	override usuarioValido() {
		return (decorado.preferenciasAlimenticias.size > 0 && decorado.usuarioValido())
	}

	override cumpleCondicion(Receta receta) {

		return (!receta.condimentos.containsKey(Condimento.SAL))
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
		return false || decorado.esVegano();
	}

	override esHipertenso() {
		return true;
	}

	override esDiabetico() {
		return false || decorado.esDiabetico();
	}

	override cumpleMismasCondiciones(Usuario usuario) {

		usuario.esHipertenso() && decorado.cumpleMismasCondiciones(usuario)
	}

	override crearPerfil() {

		val UsuarioHipertenso usuarioCopia = new UsuarioHipertenso(decorado.crearPerfil)

		return usuarioCopia
	}

	override getRecetasBuscadasFavoritas() {
	}

}
