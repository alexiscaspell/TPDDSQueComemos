package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

class UsuarioVegano extends UsuarioDecorator 
{
	new(Usuario decorado) {		
		super(decorado)
	}

	override estadoRutina() 
	{
		return (decorado.preferenciasAlimenticias.exists[ingrediente | ingrediente.contieneFruta()] && decorado.estadoRutina())			
	}

	override usuarioValido() 
	{
		return (!decorado.getPreferenciasAlimenticias().exists[ingrediente | ingrediente.contieneCarne()] && decorado.usuarioValido())
		
	}	
}
