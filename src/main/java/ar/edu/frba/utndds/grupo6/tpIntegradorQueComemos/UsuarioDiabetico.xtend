package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors


@Accessors
class UsuarioDiabetico extends UsuarioDecorator {
	
	
	new(Usuario decorado) {
		super(decorado)
	}
	
	override agregarReceta() {
		// sE VE DESPUES	
	}
	
	override estadoRutina(){
		// Rutina saludable si tiene una rutina activa o no pesa más de 70 kgs.
		if ( decorado.peso < 70  || decorado.rutina == 3 || decorado.rutina == 4 ) { 
			if ( decorado.estadoRutina() ) return true
			else return false
		} else {
			println("RUTINA NO SALUDABLE") // Esto puede ser q tenga q ir en usuarioPosta.estadoRutina()
			return false
			
		}
	}
	
	override cumpleCondicion()
	{
  		return (decorado.preferenciasAlimenticias.size>0)

	}
	
	
}