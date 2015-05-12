package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento

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
	
	override puedeComer(Receta receta) 
	{
      return ( receta.condimentos.containsKey(Condimento.SAL)&&decorado.puedeComer(receta))
    }
    
    override sePuedeSugerir(Receta receta)
    {
    	
    	return(puedeComer(receta)&&decorado.puedeComer(receta))
    }
}