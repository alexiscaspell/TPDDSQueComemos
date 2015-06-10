package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion

public class UsuarioDiabetico extends UsuarioDecorator {	
	
	
	new(Usuario decorado) 
	{
		super(decorado)
		decorado.condicion.add( Condicion.DIABETICO )
	}
	
	override estadoRutina()
	{		
		// Rutina saludable si tiene una rutina activa o no pesa más de 70 kgs.
		return ( (decorado.getPeso() < 70  || decorado.getRutina().rutinaActiva() ) 
			&& decorado.estadoRutina())		
	}	
	
	override usuarioValido()
	{
  		return ( (decorado.preferenciasAlimenticias.size > 0) && (decorado.sexo != null) && decorado.usuarioValido())  		
    }
    
    
    override cumpleCondicion(Receta receta) 
    {
        return ((receta.cantidadDeAzucar() == 0 ))
    }
    
     override notificar(){
    	decorado.getObservadores().forEach[actualizar( this )]
    }
    
    override getRecetasConAcceso() {
    	val recetario = Recetario.getInstance();
		val recetas = recetario.listarTodas();
		consultas.clear()

		recetas.forEach [ receta |
			if ( receta.puedeVer(this)) {
				consultas.add(receta)
			}
		]

		notificar()
		return consultas
    }
}