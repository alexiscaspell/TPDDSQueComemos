package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

class Usuario {
	
	private double altura;
	
	private double peso;
	
	new(double peso, double altura){
		this.altura = altura
		this.peso = peso
	}
	
	def double calcularIMC(){
		peso / (altura * altura)		
	}
			
}