package ar.edu.frba.utndds.grupo6.ui.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConAzucar
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaValida
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConSal
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConCarne
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import ar.edu.frba.utndds.grupo6.ui.AplicationModel.AplicationModel
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ConsultasXRecetas

class QueComemosApplication extends Application {

	val pepe = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO)
	recetaValida recetaEsValida = new recetaValida()
	recetaConAzucar recetaAzucar = new recetaConAzucar()
	recetaConSal recetaSal = new recetaConSal()
	recetaConCarne recetaCarne = new recetaConCarne()

	//Observadores
	private ConsultasXRecetas ConsultasXRecetas = new ConsultasXRecetas()

	static def void main(String[] args) {
		new QueComemosApplication().start()
	}

	override protected Window<?> createMainWindow() {
		pepe.marcarComoFavorita(recetaEsValida.cumple(pepe))
		pepe.marcarComoFavorita(recetaEsValida.noCumple(pepe))
		pepe.marcarComoFavorita(recetaAzucar.cumple(pepe))
		pepe.marcarComoFavorita(recetaAzucar.noCumple(pepe))
		pepe.marcarComoFavorita(recetaSal.cumple(pepe))
		pepe.marcarComoFavorita(recetaSal.noCumple(pepe))
		pepe.marcarComoFavorita(recetaCarne.cumple(pepe))
		return new PanelUsuario(pepe, this, new AplicationModel(ConsultasXRecetas.estadistica))
	}

}
