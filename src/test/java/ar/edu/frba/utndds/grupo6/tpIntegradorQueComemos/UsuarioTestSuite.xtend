package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import org.junit.Assert

class UsuarioTestSuite {

	@Test
	def void unTipoAlto() {
		val pepe = new Usuario(80.4, 1.90)
		Assert.assertEquals(22.27, pepe.calcularIMC(), 0.01)
	}
	
	@Test
	def void testEnunciado() {
		val persona_enunciado = new Usuario(83,1.88)
		Assert.assertEquals(23.48, persona_enunciado.calcularIMC(), 0.01)
	}
	
	@Test
	def void unTipoGordo() {
		val jesus = new Usuario(100,1.75)
		Assert.assertEquals(32.65, jesus.calcularIMC(), 0.01)
	}
	
	@Test
	def void homeroSimpson() {   
		val homero = new Usuario(113,1.83)
		Assert.assertEquals(33.74, homero.calcularIMC(), 0.01)
	}
	
	@Test
	def void IMCDeUnUsuarioQueMide100YPesa150(){
		val usuario = new Usuario(100,1.50)
		Assert.assertEquals(44.44, usuario.calcularIMC(), 0.01)	
	}
}
