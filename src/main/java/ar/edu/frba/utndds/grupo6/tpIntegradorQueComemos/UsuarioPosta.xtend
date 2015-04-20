package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.Date
import java.util.ArrayList

public class UsuarioPosta implements Usuario {
	
	private double altura;
	
	private double peso;
			
	private Rutinas rutina;
	
	private String nombre;
	
	private Date fechaNacimiento;
	
	private Date hoy = new Date();
			
	private ArrayList<String> preferenciasAlimenticias = new ArrayList<String>();
	
	private ArrayList<String> platosQueNoLeGustan = new ArrayList<String>();		
	
	new(double peso, double altura, Rutinas rutina) {

		this.altura = altura
		this.peso = peso
		this.rutina = rutina
		this.preferenciasAlimenticias.add("")
		
	}
	
	override boolean usuarioValido(){
		return(cumpleCamposObligatorios() && nombreCorrecto() && cumpleCondicion() && fechaNacimientoValida())
	}	
	
	override boolean cumpleCamposObligatorios(){
   		return (nombre!=null && peso>0 && altura>0 && fechaNacimiento!=null && rutina!=null);
	}
	
	override boolean fechaNacimientoValida(){
		
		return (fechaNacimiento.before(hoy))
	}
	
	override boolean nombreCorrecto()
	{
		 return (nombre.length>4);
	}	
	
	override boolean agregarUsuario(String nombre, double peso, double altura, Date fechaNacimiento, Rutinas rutinaUsuario)
	{
	   val usuarioNuevo = new UsuarioPosta(peso,altura,rutinaUsuario)
	   usuarioNuevo.setNombre(nombre)
	   usuarioNuevo.setFechaNacimiento(fechaNacimiento)
	   return usuarioNuevo.usuarioValido()	   
	}

	override double calcularIMC() {
		peso / (altura * altura)
	}

	override agregarReceta(){
		// Despues se ve		
	}

	override estadoRutina()
	{
		if ( this.calcularIMC < 18 || this.calcularIMC > 30 ) {
			throw new RutinaNoSaludableExc()
		}	
	}
	
	//Getters
	override getPeso(){
		peso
	}
	
	override getAltura(){
		altura
	}
	
	override getRutina(){
		rutina
	}
	
	override ArrayList<String> getPreferenciasAlimenticias(){
		preferenciasAlimenticias
	}
	
	override cumpleCondicion(){
		return true
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
	
	override setPlatosQueNoLeGustan(ArrayList<String> listaDeAlimentos){
		this.platosQueNoLeGustan = listaDeAlimentos;
	}
	
	override setRutina(Rutinas rutina)
	{
		this.rutina = rutina
	}
}
