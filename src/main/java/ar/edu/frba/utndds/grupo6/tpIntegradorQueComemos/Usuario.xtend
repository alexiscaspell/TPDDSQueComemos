package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors

class Usuario {
	
	
	@Accessors double IMC

	

	def calcularIMC(double peso, double altura) {
		IMC= peso/ (altura * altura)
	}
}