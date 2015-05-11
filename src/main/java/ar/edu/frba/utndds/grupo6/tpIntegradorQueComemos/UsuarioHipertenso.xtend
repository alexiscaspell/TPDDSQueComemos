package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

class UsuarioHipertenso extends UsuarioDecorator 
{	
	new(Usuario decorado) 
	{
		super(decorado)
	}
	
	override estadoRutina()
	{
		// Rutina saludable si tiene una rutina activa con ejercicio Adicional
		return (decorado.getRutina().rutinaActivaConEjercicioAdicional() && decorado.estadoRutina())		
	}
	
	override usuarioValido()
	{
		return(decorado.preferenciasAlimenticias.size > 0 && decorado.usuarioValido())		
	}	
}
