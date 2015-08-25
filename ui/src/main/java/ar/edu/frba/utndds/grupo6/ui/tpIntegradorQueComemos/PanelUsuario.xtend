package ar.edu.frba.utndds.grupo6.ui.tpIntegradorQueComemos

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel


import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.Button
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import org.uqbar.arena.widgets.tables.Column

class PanelUsuario extends MainWindow<Usuario>{

	/*new( Usuario usuario) {
		super( usuario )
	}*/


	new( ) {
		super( new UsuarioPosta(10, "Lucas") )
	}


	override createContents(Panel mainPanel) {
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
	
	def static main(String[] args) {
		new PanelUsuario().startApplication
	}
	
}