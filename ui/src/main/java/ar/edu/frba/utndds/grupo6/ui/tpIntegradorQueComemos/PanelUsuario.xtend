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

class PanelUsuario extends SimpleWindow<Usuario>{

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Buscar"
			setAsDefault
			disableOnError
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.setTitle("Bienvenido a Que Comemos?")
		
		// Panel Superior
		new Panel(mainPanel) => [		
			new Label(it).text = "RecetasFavoritas/UltimasConsultas/RecetasMasConsultadas"	
		]
		
	
		// Panel Medio
		new Panel( mainPanel ) => [
			//layout = new HorizontalLayout
			var table = new Table<Receta>( it, typeof(Receta ))
			new Column<Receta>(table) => [
 			  title = "Nombre"
 			  fixedSize = 150
 			  bindContentsToProperty("nombre")
			]
			new Column<Receta>(table) => [
 			  title = "Calorias"
 			  fixedSize = 150
 			  bindContentsToProperty("calorias")
			]
			new Column<Receta>(table) => [
 			  title = "Dificultad"
 			  fixedSize = 150
 			  bindContentsToProperty("dificultad")
			]
			new Column<Receta>(table) => [
 			  title = "Temporada"
 			  fixedSize = 150
 			  bindContentsToProperty("temporada")
			]
		]
		
		// Panel Inferior
		new Panel( mainPanel ) => [
			new Button( it ) => [
				it.caption = "Ver"
			]
		]
					
	}

	new( Usuario usuario,WindowOwner parent ) {
		super( parent,usuario )
	}

}

	