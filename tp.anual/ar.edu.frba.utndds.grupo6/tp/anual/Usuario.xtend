package tp.anual

class Usuario {

	float IMC

	def calcularIMC(float peso, float altura) {
		this.IMC = peso / ( altura * altura )
	}
}
