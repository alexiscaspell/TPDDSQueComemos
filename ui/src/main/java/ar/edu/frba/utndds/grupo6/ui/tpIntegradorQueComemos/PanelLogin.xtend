package ar.edu.frba.utndds.grupo6.ui.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.RepoUsuarios
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow

class PanelLogin extends MainWindow<ControlLogin>{
		
	new() {
		super(new ControlLogin(new RepoUsuarios()))
	}


	
	def static main(String[] args) {
		new PanelLogin().startApplication
	}
	
	override createContents(Panel mainPanel) {
		
		this.title = "Login"
					
		new Label(mainPanel).text = "Usuario"
		
		new TextBox(mainPanel).bindValueToProperty("nickname")
				
		new Label(mainPanel).text = "Contraseña"
		
		new TextBox(mainPanel).bindValueToProperty("password")
		
					
		new Panel( mainPanel ) => [
			
			layout = new HorizontalLayout
				
			new Button( it ) => [
				
				it.caption = "Ok"
								
				onClick [ | this . modelObject.validarNickYContraseña(this.modelObject.nickname,this.modelObject.password) ]
			]
		
		new Button( it ) => [
				it.caption = "Cancelar"
			]	
			]

	}
	
	
}