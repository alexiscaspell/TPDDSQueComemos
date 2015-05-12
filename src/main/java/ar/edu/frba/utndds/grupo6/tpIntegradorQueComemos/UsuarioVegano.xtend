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
	override puedeComer(Receta receta) 
	{
       return ((receta.ingredientes.filter[condimento, cantidad| condimento.contieneCarne()].size() == 0)&& decorado.puedeComer(receta))
    }	
    
     override sePuedeSugerir(Receta receta){
    	
    	return(puedeComer(receta)&&decorado.puedeComer(receta))
    }
}