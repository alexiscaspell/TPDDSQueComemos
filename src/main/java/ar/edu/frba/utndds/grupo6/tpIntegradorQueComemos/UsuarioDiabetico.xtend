package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
public class UsuarioDiabetico extends UsuarioDecorator {	
	
	
	new(Usuario decorado) 
	{
		super(decorado)
	}
	
	override estadoRutina()
	{		
		// Rutina saludable si tiene una rutina activa o no pesa más de 70 kgs.
		if (decorado.getPeso() < 70  || 
			decorado.getRutina() == Rutinas.INTENSIVO || 
			decorado.getRutina() == Rutinas.ACTIVA_SIN_EJERCICIO) 
		{
			decorado.estadoRutina()
		}
		else 
		{
			throw new RutinaNoSaludableExc()
		}
	}	
	
	override usuarioValido()
	{
  		if ((decorado.preferenciasAlimenticias.length>0) && (decorado.sexo != null)) 
  		{
  			return true 
  		} 
  		else
  		{
  		 	throw new UsuarioNoValidoExc()	
  		}
	}
	
}
