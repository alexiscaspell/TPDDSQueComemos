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
		//Ver si se hace un enum con las posibles preferencias alimenticias
		if (this.preferenciasAlimenticias.contains("Frutas"))
		{
			decorado.estadoRutina()
		}		  
		else
		{
			throw new RutinaNoSaludableExc()
		} 
	} 
	
	
}