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
import java.util.Date
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.UsuariosRepository

class QueComemosApplication extends Application {

	val pepe = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO,
		new Date(1989, 8, 7))
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
		pepe.marcarComoFavorita(recetaEsValida.cumple(pepe.nombre))
		pepe.marcarComoFavorita(recetaEsValida.noCumple(pepe.nombre))
		pepe.marcarComoFavorita(recetaAzucar.cumple(pepe.nombre))
		pepe.marcarComoFavorita(recetaAzucar.noCumple(pepe.nombre))
		pepe.marcarComoFavorita(recetaSal.cumple(pepe.nombre))
		pepe.marcarComoFavorita(recetaSal.noCumple(pepe.nombre))
		pepe.marcarComoFavorita(recetaCarne.cumple(pepe.nombre))
		new UsuariosRepository("Usuario").create(pepe)
		var usuario = new UsuariosRepository("Usuario").FindBy("Juan Jose Lopez")
		return new PanelUsuario(usuario, this, new AplicationModel(ConsultasXRecetas.estadistica))
	}

}
