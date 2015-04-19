package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List

class UsuarioPosta implements Usuario {
	
	private double altura;
	
	private double peso;
	
	private Rutinas rutina;
	
	private List<String> preferenciasAlimenticias;	 

	new(double peso, double altura, Rutinas rutina) {
		this.altura = altura
		this.peso = peso
		this.rutina = rutina
	}

	override double calcularIMC() {
		peso / (altura * altura)
	}

	override agregarReceta(){
		// Despues se ve		
	}

	override estadoRutina(){
		if ( this.calcularIMC < 18 || this.calcularIMC > 30 ) {
			throw new RutinaNoSaludableExc()
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
	
	override getPreferenciasAlimenticias() {
		return preferenciasAlimenticias
	}
	
}
