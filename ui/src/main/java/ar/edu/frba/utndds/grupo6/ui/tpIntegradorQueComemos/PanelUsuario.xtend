package ar.edu.frba.utndds.grupo6.ui.tpIntegradorQueComemos


import org.uqbar.arena.widgets.Panel


import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.Button
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.ColumnLayout

class PanelUsuario extends SimpleWindow<Usuario>{

	
	override protected addActions(Panel actionsPanel) {
		new Panel( actionsPanel ) => [
			new Button( it ) => [
				it.caption = "Boton Extra"
				//onClick = [new PanelReceta( elementSelected , this)]
				
			]
		
		]
	}		
	
	def void createGridActions(Panel mainPanel) {
		//val elementSelected = new NotNullObservable("nombre")
		new Button( mainPanel ) => [
			it.caption = "Ver"
			//onClick = [new PanelReceta( elementSelected , this)]
			//bindEnabled(elementSelected)
		]
	}
	
				
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
		
	def protected createResultsGrid(Panel mainPanel) {
		// Crea la table de Recetas
		var table = new Table<Receta>( mainPanel, typeof(Receta )) =>[
				bindItemsToProperty("favoritas")
				it.height =  500
				//bindValueToProperty("recetaSeleccionado")
			]
		this.ResultadoRecetas( table )
	}
					
	override def createMainTemplate(Panel mainPanel) {
		// Llama a las funciones
		setTitle("Bienvenido a Que Comemos?")
		taskDescription = "Seleccione la receta que quiere ver"
		super.createMainTemplate(mainPanel)

		this.createResultsGrid( mainPanel )
		this.createGridActions(mainPanel)
	}
	

	new( Usuario usuario,WindowOwner parent ) {
		super( parent,usuario )
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Panel( mainPanel ) => [
			layout = new HorizontalLayout
			new Label(mainPanel).text = "Recetas Favortias / Recetas Consultadas / Recetas mas vistas"
			new Label(mainPanel).text = "Recetas Consultadas / Recetas mas vistas"
			new Label(mainPanel).text = "Recetas mas vistas"
			]
	}
	
	
}

	