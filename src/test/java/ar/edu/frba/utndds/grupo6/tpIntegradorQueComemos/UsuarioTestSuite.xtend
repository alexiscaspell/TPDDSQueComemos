package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import org.junit.Assert

class UsuarioTestSuite {

	@Test
	def void unTipoAlto() {
		val pepe = new Usuario()
		pepe.calcularIMC(80.4, 1.90)
		Assert.assertEquals(22.27, pepe.IMC, 0.01)
	}
	
	def void testEnunciado() {
		val persona_enunciado = new Usuario()
		persona_enunciado.calcularIMC(83, 1.88)
		Assert.assertEquals(23.48, persona_enunciado.IMC, 0.01)
	}

}
