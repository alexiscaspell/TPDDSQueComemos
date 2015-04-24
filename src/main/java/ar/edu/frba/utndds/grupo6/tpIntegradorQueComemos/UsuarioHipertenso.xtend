package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UsuarioHipertenso extends UsuarioDecorator 
{	
	new(Usuario decorado) 
	{
		super(decorado)
	}
	
	override estadoRutina()
	{
		// Rutina saludable si tiene una rutina activa con ejercicio Adicional
		return (decorado.getRutina() == Rutinas.INTENSIVO && decorado.estadoRutina() )
		
	}
	
	override usuarioValido()
	{
		return( decorado.preferenciasAlimenticias.size>0 && decorado.usuarioValido() )
		
	}	
}
