package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

class UsuarioPosta implements Usuario {
	
	private double altura;
	private double peso;

	new(double peso, double altura) {
		this.altura = altura
		this.peso = peso
	}

	override double calcularIMC() {
		peso / (altura * altura)
	}

	override agregarReceta(){
		// Despues se ve
		
	}

	override estadoRutina(){
		if ( this.calcularIMC > 18 && this.calcularIMC < 30 )
			println( "RUTINA SALUDABLE ")
	}
}
