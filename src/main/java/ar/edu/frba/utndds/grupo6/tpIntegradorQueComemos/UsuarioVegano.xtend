package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UsuarioVegano extends UsuarioDecorator {
	
	
	new(Usuario decorado) {
		super(decorado)
	}
	
	override agregarReceta() {
		// sE VE DESPUES	
	}
	
	override estadoRutina(){
		// if fruta en preferencias alimenticias =>
		decorado.estadoRutina()  
		println("RUTINA NO SALUDABLE")
	}
	
	
}