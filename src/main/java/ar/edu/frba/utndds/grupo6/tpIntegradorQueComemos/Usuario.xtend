package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

class Usuario {
	
	private double _altura;
	
	private double _peso;
	
	new(double peso, double altura){
		_altura = altura
		_peso = peso
	}
	
	def double calcularIMC(){
		_peso / (_altura * _altura)		
	}
			
}