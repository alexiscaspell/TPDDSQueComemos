package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors

import java.util.ArrayList
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Dificultad
import java.util.Map
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import java.util.List

@Accessors
public abstract class UsuarioDecorator implements Usuario, Consumidor {
	
	Usuario decorado
	
	private RepositorioRecetas recetario
	
	new(Usuario usuario) 
	{
		recetario = RepositorioRecetas.getInstance()
		decorado = usuario
	}
	
	override modificarReceta(String nombreReceta, String nuevo_nombre, Map<Ingrediente, Integer> ingredientes,
		Map<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad,
		ArrayList<Temporada> temporada) {
		decorado.modificarReceta( nombreReceta, nuevo_nombre, ingredientes,condimentos, explicacion, dificultad, temporada  )
	}	
	
	override estadoRutina(){
		decorado.estadoRutina()
	}	
	
	override agregarReceta(Receta receta){
		decorado.agregarReceta( receta )
	}
	
	//Getters
	
	override getReceta(String nombre){
		decorado.getReceta(nombre)
	}
	
	override getPeso(){
		decorado.getPeso()
	}
	
	override getAltura(){
		decorado.getAltura()
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
	
	override getRecetasConocidas(){
		decorado.getRecetasConocidas
	}
			
	override usuarioValido(){
		decorado.usuarioValido()
	}
	
	override comparteGrupo(Usuario usuario) {
		decorado.comparteGrupo(usuario)
	}
	
	override marcarComoFavorita(Receta receta)
	{
		decorado.marcarComoFavorita(receta)
	}
	
	override puedeComer(Receta receta) 
	{
      return (cumpleCondicion(receta) &&decorado.puedeComer(receta))
    }
    
    def boolean cumpleCondicion(Receta receta)
    
    override sePuedeSugerir(Receta receta)
    {  	
    	return(puedeComer(receta)&&decorado.sePuedeSugerir(receta))
    }
    
    override getRecetasConAcceso(List<Receta> recetas) 
	{
		decorado.getRecetasConAcceso(recetas)
	}
	
	override agregarGrupo(Grupo grupo)
	{
		decorado.agregarGrupo(grupo)
	}
}
