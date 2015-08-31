package ar.edu.frba.utndds.grupo6.ui.tpIntegradorQueComemos

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.Button
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.bindings.NotNullObservable
import ar.edu.frba.utndds.grupo6.ui.AplicationModel.AplicationModel

class PanelUsuario extends SimpleWindow<AplicationModel>{

	// Panel de Botones 
	override protected addActions(Panel actionsPanel) {
		val elementSelected = new NotNullObservable("recetaSeleccionada")
		new Button( actionsPanel ) => [
			it.caption = "Ver"
			it.width = 460
			onClick = [new PanelReceta(this, modelObject.getSeleccionada()).open]
			bindEnabled(elementSelected)
		]
	}
			
	
	// Crea las columnas de la tabla Recetas 				
	def void ResultadoRecetas(Table<Receta> table) { 
		new Column<Receta>(table) => [
 		  title = "Nombre"
 		  fixedSize = 100
 		  bindContentsToProperty("nombre")
		]
		new Column<Receta>(table) => [
 		  title = "Calorias"
 		  fixedSize = 40
 		  bindContentsToProperty("calorias")
		]
		new Column<Receta>(table) => [
 		  title = "Dificultad"
 		  fixedSize = 60
 		  bindContentsToProperty("dificultad")
		]
		new Column<Receta>(table) => [
 		  title = "Temporada"
 		  fixedSize = 250
 		  bindContentsToProperty("temporadas")
		]
	}

	// Crea la tabla de Recetas		
	def protected createResultsGrid(Panel mainPanel) {
		// Crea la table de Recetas
		var table = new Table<Receta>( mainPanel, typeof(Receta )) =>[
				bindItemsToProperty("resultados")
				it.height =  800
				bindValueToProperty("recetaSeleccionada")
			]
		this.ResultadoRecetas( table )
	}
					
	override def createMainTemplate(Panel mainPanel) {
		// Llama a las funciones
		setTitle("Bienvenido a Que Comemos?")
		taskDescription = "Seleccione la receta que quiere ver"
		
		//super.createMainTemplate(mainPanel)
		createFormPanel( mainPanel )
		this.createResultsGrid( mainPanel )
		addActions( mainPanel ) 
		
	}
	

	new( Usuario usuario,WindowOwner parent, AplicationModel aplication ) {
		super( parent,aplication )
		modelObject.resultadosRecetas( usuario )
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel( mainPanel ) => [
			layout = new HorizontalLayout
			new Label(mainPanel)=> [
				it.text = "Recetas Favortias / Recetas Consultadas / Recetas mas vistas"
				it.fontSize = 14 
			]			
		]
	}
	
	
}
