package ar.edu.frba.utndds.grupo6.ui.tpIntegradorQueComemos

import org.uqbar.arena.Application
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.util.Date
import java.text.DateFormat
import java.text.SimpleDateFormat
import org.uqbar.arena.windows.Window

class QueComemosApplication extends Application {
	
	
	static def void main(String[] args) { 
		new QueComemosApplication().start()
	}

	
	
		override protected Window<?> createMainWindow() {
		return new PanelReceta( )
	}
	
	
}