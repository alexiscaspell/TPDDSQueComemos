package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import org.junit.Assert

class UsuarioTestSuite {

	Usuario diabetico
	Usuario hipertenso

	@Test
	def void unTipoAlto() {
		val pepe = new UsuarioPosta(80.4, 1.90, 0)
		Assert.assertEquals(22.27, pepe.calcularIMC(), 0.01)
	}

	@Test
	def void testEnunciado() {
		val persona_enunciado = new UsuarioPosta(83, 1.88, 0)
		Assert.assertEquals(23.48, persona_enunciado.calcularIMC(), 0.01)
	}

	@Test
	def void unTipoGordo() { /*perdoname jesus por decirte gordo en pascua */
		val jesus = new UsuarioPosta(100, 1.75, 0)
		Assert.assertEquals(32.65, jesus.calcularIMC(), 0.01)
	}

	@Test
	def void homeroSimpson() {
		val homero = new UsuarioPosta(113, 1.83, 0)
		Assert.assertEquals(33.74, homero.calcularIMC(), 0.01)
	}

	@Test
	def void IMCDeUnUsuarioQueMide100YPesa150() {
		val usuario = new UsuarioPosta(100, 1.50, 0)
		Assert.assertEquals(44.44, usuario.calcularIMC(), 0.01)
	}

	@Test
	def void UsuarioDiabetico() {
		val usuarioDiabeticoSaludable = new UsuarioPosta(83, 1.88, 3)
		diabetico = new UsuarioDiabetico( usuarioDiabeticoSaludable )
		Assert.assertTrue( diabetico.estadoRutina() )
		
		val usuarioDiabeticoNoSaludable = new UsuarioPosta( 83, 1.88, 0 )
		diabetico = new UsuarioDiabetico( usuarioDiabeticoNoSaludable )
		Assert.assertFalse( diabetico.estadoRutina() )
		
		val usuarioDiabeticoGordo = new UsuarioPosta( 100, 1.7, 3 )
		diabetico = new UsuarioDiabetico( usuarioDiabeticoGordo )
		Assert.assertFalse( diabetico.estadoRutina() )
	}
	
	@Test
	def void UsuarioHipertenso() {
		val usuarioHipertensoSaludable = new UsuarioPosta(83, 1.88, 3)
		hipertenso = new UsuarioHipertenso( usuarioHipertensoSaludable )
		Assert.assertTrue( hipertenso.estadoRutina() )
		
		val usuarioHipertensoNoSaludable = new UsuarioPosta( 83, 1.88, 0 )
		hipertenso = new UsuarioHipertenso( usuarioHipertensoNoSaludable )
		Assert.assertFalse( hipertenso.estadoRutina() )
		
		val usuarioHipertensoGordo = new UsuarioPosta( 100, 1.7, 3 )
		hipertenso = new UsuarioHipertenso( usuarioHipertensoGordo )
		Assert.assertFalse( hipertenso.estadoRutina() )
	}
}
