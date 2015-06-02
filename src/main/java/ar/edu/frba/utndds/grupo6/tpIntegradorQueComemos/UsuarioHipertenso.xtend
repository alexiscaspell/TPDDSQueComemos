package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion

class UsuarioHipertenso extends UsuarioDecorator 
{	
	new(Usuario decorado) 
	{
		super(decorado)
		decorado.condicion.add( Condicion.HIPERTENSO )
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
	
	override cumpleCondicion(Receta receta){
		
		return(!receta.condimentos.containsKey(Condimento.SAL))
	}
	
}