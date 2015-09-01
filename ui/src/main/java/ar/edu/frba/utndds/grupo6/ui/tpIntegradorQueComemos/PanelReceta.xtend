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

class PanelReceta extends SimpleWindow<DetalleReceta>{

	new(WindowOwner parent, DetalleReceta detalleReceta) 
	{
		super(parent, detalleReceta)
	}

	override protected createFormPanel(Panel mainPanel) 
	{
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
			it.layout = new HorizontalLayout
			new Panel(it) => [
				new Label(it).text = "Dificultad"
				new Label(it).bindValueToProperty("dificultadReceta")
				new Label(it).text = "Ingredientes"
				new Table(it, typeof(Ingrediente)) => [
					items <=> "ingredientesReceta"										
				]
				new CheckBox(mainPanel)=>[
					value <=> "esFavorita"
				]
			]
			new Panel(it) => [
				new Label(it).text = "Temporadas"
				new Table(it, typeof(Ingrediente)) => [
					items <=> "temporadasReceta"										
				]
			]
		]
		
		// Panel Inferior
		new Panel(mainPanel) => [
			new Label(it).text = "Proceso de Preparacion"
			new Label(it) => [
				value <=> "explicacionReceta"
			]			   	 						
		]
					
	}
	
	override protected addActions(Panel actionsPanel) 
	{
		new Button( actionsPanel ) => [
				it.caption = "Volver"
			]		
	}
	
//	def void setTableIngredientes(Table<Ingrediente> table) { 
//		new Column<Ingrediente>(table) => [
// 		  title = "Nombre"
// 		  fixedSize = 200
// 		  bindContentsToProperty("nombre")
//		]
//	}
	
//	def void setTableTemporadas(Table<Temporada> table) { 
//		new Column<Temporada>(table) => [
// 		  title = "Nombre"
// 		  fixedSize = 200
// 		  bindContentsToProperty("nombre")
//		]
//	}
	
//	def protected createGridIngredientes(Panel mainPanel) {
//		// Crea la table de Recetas
//		var table = new Table<Ingrediente>(mainPanel, typeof(Ingrediente)) =>[
//				bindItemsToProperty("ingredientesReceta")
//				it.height =  800
//			]
//		this.setTableIngredientes(table)
//	}
	
//	def protected createGridTemporada(Panel mainPanel) {
//		// Crea la table de Recetas
//		var table = new Table<Temporada>(mainPanel, typeof(Temporada)) =>[
//				bindItemsToProperty("temporadasReceta")
//				it.height =  800
//			]
//		this.setTableTemporadas(table)
//	}	
}