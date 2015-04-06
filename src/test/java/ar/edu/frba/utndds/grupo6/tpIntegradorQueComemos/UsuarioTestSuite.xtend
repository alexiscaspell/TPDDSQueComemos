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
	
	@Test
	def void testEnunciado() {
		val persona_enunciado = new Usuario()
		persona_enunciado.calcularIMC(83, 1.88)
		Assert.assertEquals(23.48, persona_enunciado.IMC, 0.01)
	}
	@Test
	def void unTipoGordo() {    /*perdoname jesus por decirte gordo en pascua*/ 
		val jesus = new Usuario()
		jesus.calcularIMC(100, 1.75)
		Assert.assertEquals(32.65, jesus.IMC, 0.01)
	}
	
	@Test
	def void homeroSipson() {   
		val homero = new Usuario()
		homero.calcularIMC(113, 1.83)
		Assert.assertEquals(33.74, homero.IMC, 0.01)
	
}
