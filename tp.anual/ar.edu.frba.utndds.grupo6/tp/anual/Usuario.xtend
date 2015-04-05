package tp.anual

class Usuario {

	float peso
	float altura

	new(float peso, float altura) {
		this.peso = peso;
		this.altura = altura;
	}

	def calcularIMC(float peso, float altura) {
		peso / ( altura * altura )
	}
}
