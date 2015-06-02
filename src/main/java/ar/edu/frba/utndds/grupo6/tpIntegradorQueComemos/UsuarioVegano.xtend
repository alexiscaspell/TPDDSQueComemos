package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion

class UsuarioVegano extends UsuarioDecorator 
{
	new(Usuario decorado) {		
		super(decorado)
		decorado.condicion.add( Condicion.VEGANO )
	}

	override estadoRutina() 
	{
		return (decorado.preferenciasAlimenticias.exists[ingrediente | ingrediente.contieneFruta()] && decorado.estadoRutina())			
	}

	override usuarioValido() 
	{
		return (!decorado.getPreferenciasAlimenticias().exists[ingrediente | ingrediente.contieneCarne()] && decorado.usuarioValido())
		
	}
	override cumpleCondicion(Receta receta) 
	{
       return ((receta.ingredientes.filter[condimento, cantidad| condimento.contieneCarne()].size() == 0))
    }	
    
}