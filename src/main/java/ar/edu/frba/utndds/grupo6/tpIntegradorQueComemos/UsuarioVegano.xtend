package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UsuarioVegano extends UsuarioDecorator 
{
	new(Usuario decorado) {
		
		super(decorado)
	}

	override estadoRutina() 
	{
		//Ver si se hace un enum con las posibles preferencias alimenticias
		return (decorado.preferenciasAlimenticias.contains(Ingrediente.FRUTA) && decorado.estadoRutina )
			
	}

	override usuarioValido() 
	{
		return ( !decorado.getPreferenciasAlimenticias().contains(Ingrediente.POLLO) && decorado.usuarioValido() ) //faltan chori, etc (VER ENUMS)//
		//reemplazar por forEach
	}
	
	
}
