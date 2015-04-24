package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors

import java.util.Date
import java.util.ArrayList
import java.util.HashMap

@Accessors
abstract class UsuarioDecorator implements Usuario {
	
	Usuario decorado
	
	private Recetario recetario
	
	new(Usuario usuario) 
	{
		recetario = Recetario.getInstance()
		decorado = usuario
	}
	
	override modificarReceta(String nombreReceta, String nuevo_nombre, HashMap<Ingrediente, Integer> ingredientes,
		HashMap<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad,
		ArrayList<Temporada> temporada) {
		decorado.modificarReceta( nombreReceta, nuevo_nombre, ingredientes,condimentos, explicacion, dificultad, temporada  )
	}
	
	override getReceta( String nombre ){
		decorado.getReceta( nombre )
	}	
	
	override estadoRutina(){
		decorado.estadoRutina()
	}
	
	
	//getters
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
	
	override getPreferenciasAlimenticias(){
		decorado.getPreferenciasAlimenticias()
	}
	
	override getSexo(){
		decorado.getSexo()
	}
	
	override getRutina(){
		decorado.getRutina()
		
	}
	
			
	override usuarioValido(){
		decorado.usuarioValido()
	}
	
	//Setters
	override setNombre(String unNombre){
		
		this.nombre=unNombre
	}
	
	override setFechaNacimiento(Date unaFecha){
		
		this.fechaNacimiento=unaFecha
	}
	
	override setPeso(double peso){
		this.peso = peso;
	}
	
	override setAltura(double altura){
		this.altura = altura;
	}
	
	override setPreferenciasAlimenticias(Ingrediente alimento){
		this.preferenciasAlimenticias.add(alimento)
	}
	
	override setSexo(Sexo sexo){
		this.sexo=sexo;
	}
	
	override setPlatosQueNoLeGustan(ArrayList<String> listaDeAlimentos){
		this.platosQueNoLeGustan = listaDeAlimentos;
	}
	
	override setRutina(Rutinas rutina)
	{
		this.rutina = rutina
	}
	
	override agregarReceta(Receta receta)
	{
		recetario.agregarReceta(receta)
	}
}
