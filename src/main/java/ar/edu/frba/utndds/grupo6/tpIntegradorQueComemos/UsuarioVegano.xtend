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
		println("RUTINA NO SALUDABLE") // Esto puede ser q tenga q ir en usuarioPosta.estadoRutina()
		return false 
	} 
	
	override cumpleCondicion(){
		return (decorado.preferenciasAlimenticias.contains("pollo")||decorado.preferenciasAlimenticias.contains("carne")||decorado.preferenciasAlimenticias.contains("chivito")||decorado.preferenciasAlimenticias.contains("chori"))
	}
	
}