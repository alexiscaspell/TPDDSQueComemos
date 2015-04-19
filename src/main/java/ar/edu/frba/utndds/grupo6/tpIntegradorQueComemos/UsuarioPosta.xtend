package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.Date
import java.util.ArrayList

class UsuarioPosta implements Usuario {
	
	private double altura;
	private double peso;
	private String nombre;
	private Date fechaNacimiento;
	private ArrayList<String> preferenciasAlimenticias = new ArrayList<String>()
      
	
	// 0 - LEVE
	// 1 - NADA 
	// 2 - MEDIANO
	// 3 - INTENSIVO
	// 4 - Activa sin ejercicio adicional  
	
	private int rutina; 

	new(double peso, double altura, int rutina) {
		this.altura = altura
		this.peso = peso
		this.rutina = rutina
		this.preferenciasAlimenticias.add("")
		
	}
	
	override boolean usuarioValido(){
		return(cumpleCamposObligatorios() && nombreCorrecto() && cumpleCondicion())
	}
	
	
	override boolean cumpleCamposObligatorios(){
   		return (nombre!=null && peso>0 && altura>0 && fechaNacimiento!=null && rutina>0);
	}
	
	override boolean nombreCorrecto()
	{
		 return (nombre.length>4);
	}
	
	override setNombre(String unNombre){
		
		this.nombre=unNombre
	}
	
	override setFechaNacimiento(Date unaFecha){
		
		this.fechaNacimiento=unaFecha
	}
	
	
	override boolean agregarUsuario(String nombre, double peso, double altura, Date fechaNacimiento, int rutinaUsuario)
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

	override estadoRutina(){
		if ( this.calcularIMC > 18 && this.calcularIMC < 30 ) {
			println( "RUTINA SALUDABLE ")
			return true
		} else {
			println( "RUTINA NO SALUDABLE ")
			return false
		}
	
	}
	
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
	

}
