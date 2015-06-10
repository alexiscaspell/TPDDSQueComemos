package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
public abstract class UsuarioDecorator implements SujetoObservado ,Usuario, Consumidor {
	
	Usuario decorado
	
	private Recetario recetario
	
	new(Usuario usuario) 
	{
		recetario = Recetario.getInstance()
		decorado = usuario
	}
	//	------------------------------------------- Getters -------------------------------------------
	override getCondicion(){
		decorado.getCondicion()
	}
	
	override getPeso(){
		decorado.getPeso()
	}
	
	override getNombre(){
		decorado.getNombre()
	}
	
	override getConsultas(){
		decorado.getConsultas()
	}
	
	override getPlatosQueNoLeGustan(){
		decorado.getPlatosQueNoLeGustan
	}
	
	override getPreferenciasAlimenticias(){
		decorado.getPreferenciasAlimenticias()
	}
	
	override getSexo(){
		decorado.getSexo()
	}
	
	override getRutina(){
		decorado.getRutina()		
	}	
	
	override List<Receta> getRecetas(){
		decorado.getRecetas()
	}
	
	override getObservadores(){
		decorado.getObservadores()
	} 	
	
	//	------------------------------------------- Metodos -------------------------------------------
	override usuarioValido(){
		decorado.usuarioValido()
	}
	
	override comparteGrupo(Usuario usuario) {
		decorado.comparteGrupo(usuario)
	}
	
	override puedeComer(Receta receta) 
	{
      return ( cumpleCondicion(receta) && decorado.puedeComer(receta) )
    }
    
    def boolean cumpleCondicion(Receta receta)
    
    override sePuedeSugerir(Receta receta)
    {  	
    	return( puedeComer(receta)&& decorado.sePuedeSugerir( receta ) )
    }
    
   override agregarGrupo(Grupo grupo)
	{
		decorado.agregarGrupo(grupo)
	}
	
	// ------------------------------------------------ Metodos Observer y Alternativa------------------------------------------------
	
	
	override addObservador(Observador observador) {
		decorado.addObservador( observador )
	}

	override removeObservador(Observador observador) {
		decorado.removeObservador( observador )
	}
	
}
