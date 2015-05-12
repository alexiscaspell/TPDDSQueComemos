package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors

import java.util.ArrayList
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Dificultad
import java.util.Map

@Accessors
abstract class UsuarioDecorator implements Usuario, Consumidor {
	
	Usuario decorado
	
	private Recetario recetario
	
	new(Usuario usuario) 
	{
		recetario = Recetario.getInstance()
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
	
	override getRecetario()
	{
		recetario
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
}
