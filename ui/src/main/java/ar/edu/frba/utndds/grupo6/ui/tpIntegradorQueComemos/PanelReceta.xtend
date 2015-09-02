package ar.edu.frba.utndds.grupo6.ui.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.ui.AplicationModel.DetalleReceta
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion

class PanelReceta extends SimpleWindow<DetalleReceta> {

	new(WindowOwner parent, DetalleReceta detalleReceta) {
		super(parent, detalleReceta)
	}

	override protected createFormPanel(Panel mainPanel) {
		mainPanel.layout = new VerticalLayout
		this.setTitle("Detalle de Receta")

		// Panel Superior
		new Panel(mainPanel) => [
			new Label(it) => [
				value <=> "nombreReceta"
			]
			new Panel(it) => [
				it.layout = new HorizontalLayout
				new Label(it) => [
					value <=> "caloriasReceta"
				]
				new Label(it) => [
					value <=> "autorReceta"
				]
			]
		]

		// Panel Medio
		new Panel(mainPanel) => [
			layout = new HorizontalLayout
			new Panel(it) => [
				new Label(it).text = "Dificultad"
				new Label(it).bindValueToProperty("dificultadReceta")
				new Label(it).text = "Ingredientes"
				new Table(it, typeof(Ingrediente)) => [
					items <=> "ingredientesReceta"
				]
				new Panel(it) => [
					layout = new HorizontalLayout
					new Label(it).text = "Favorita"
					new CheckBox(it) => [
						value <=> "esFavorita"
					]
				]
			]
			new Panel(it) => [
				new Label(it).text = "Temporadas"
				new Table(it, typeof(Ingrediente)) => [
					items <=> "temporadasReceta"
				]
				new Label(it).text = "Condimentos"
				new Table(it, typeof(Condimento)) => [
					items <=> "condimentosReceta"
				]
				new Label(it).text = "Condiciones Preexistentes"
				new Table(it, typeof(Condicion)) => [
					items <=> "condicionesPreexistentes"
				]
			]
		]

		new Panel(mainPanel) => [
			new Panel(it) => [
				new Label(it).text = "Proceso de Preparacion"
				new Label(it) => [
					value <=> "explicacionReceta"
				]
			]
		]
	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			it.caption = "Volver"
			onClick = [
				this.close
			]
		]
	}
}
