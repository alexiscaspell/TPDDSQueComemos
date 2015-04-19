package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UsuarioHipertenso extends UsuarioDecorator {
	
	
	new(Usuario decorado) {
		super(decorado)
	}
	
	override agregarReceta() {
		// sE VE DESPUES	
	}
	
	override estadoRutina(){
		// if tiene una rutina activa intensiva con ejercicio adicional
		decorado.estadoRutina()  
		println("RUTINA NO SALUDABLE") // Esto puede ser q tenga q ir en usuarioPosta.estadoRutina()
		return false
	} 
	
	
}