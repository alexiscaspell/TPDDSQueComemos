package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

class UsuarioPosta implements Usuario {
	
	private double altura;
	private double peso;
	
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
}
