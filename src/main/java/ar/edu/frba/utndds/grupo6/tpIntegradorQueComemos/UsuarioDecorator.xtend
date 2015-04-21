package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors

import java.util.Date
import java.util.ArrayList
import java.util.HashMap

@Accessors
abstract class UsuarioDecorator implements Usuario {
	
	Usuario decorado
	
	new(Usuario usuario) {
		decorado = usuario
	}
	
	
	
	override agregarRecetaSimple(String nombre, HashMap<Ingrediente, Integer> ingredientes,
		HashMap<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad,
		ArrayList<Temporada> temporada)
	{
		decorado.agregarRecetaSimple( nombre , ingredientes, condimentos, explicacion, dificultad, temporada )
	}
	
	override agregarRecetaCompuesta( String composicion1, String compsicion2 ){
		decorado.agregarRecetaCompuesta( composicion1, compsicion2 )
	}
	
	override modificarReceta() {
		decorado.modificarReceta()
	}
	
	override getReceta( String nombre ){
		decorado.getReceta( nombre )
	}
	
	
	override estadoRutina(){
		decorado.estadoRutina()
	}
	
	
	override fechaNacimientoValida(){
		decorado.fechaNacimientoValida()
	}
	
	//getters
	override calcularIMC(){
		decorado.calcularIMC()
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
	
	override getRutina(){
		decorado.getRutina()
		
	}
	
	override cumpleCondicion(){
		decorado.cumpleCondicion()
	}
	
	override nombreCorrecto(){
		decorado.nombreCorrecto
	}
	
	override cumpleCamposObligatorios(){
		decorado.cumpleCamposObligatorios()
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
	
	override setPreferenciasAlimenticias(ArrayList<String> listaDeAlimentos){
		this.preferenciasAlimenticias = listaDeAlimentos;
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
}

