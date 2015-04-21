package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UsuarioHipertenso extends UsuarioDecorator {
	
	
	new(Usuario decorado) 
	{
		super(decorado)
	}
	
	override estadoRutina()
	{
		// Rutina saludable si tiene una rutina activa con ejercicio Adicional
		if (decorado.getRutina() == Rutinas.INTENSIVO)
		{
			decorado.estadoRutina()
		} else 
		{
			throw new RutinaNoSaludableExc()	
		}
	}
	
	override cumpleCondicion()
	{
			return (decorado.preferenciasAlimenticias.size>0)
	}
}
