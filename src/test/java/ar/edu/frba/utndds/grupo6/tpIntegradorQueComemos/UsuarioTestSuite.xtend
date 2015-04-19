package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import org.junit.Assert

class UsuarioTestSuite {

	Usuario diabetico
	Usuario hipertenso

	@Test
	def void unTipoAlto() {
		val pepe = new UsuarioPosta(80.4, 1.90, Rutinas.LEVE)
		Assert.assertEquals(22.27, pepe.calcularIMC(), 0.01)
	}

	@Test
	def void testEnunciado() {
		val persona_enunciado = new UsuarioPosta(83, 1.88, Rutinas.LEVE)
		Assert.assertEquals(23.48, persona_enunciado.calcularIMC(), 0.01)
	}

	@Test
	def void unTipoGordo() {
		val jesus = new UsuarioPosta(100, 1.75, Rutinas.LEVE)
		Assert.assertEquals(32.65, jesus.calcularIMC(), 0.01)
	}

	@Test
	def void homeroSimpson() {
		val homero = new UsuarioPosta(113, 1.83, Rutinas.LEVE)
		Assert.assertEquals(33.74, homero.calcularIMC(), 0.01)
	}

	@Test
	def void IMCDeUnUsuarioQueMide100YPesa150() {
		val usuario = new UsuarioPosta(100, 1.50, Rutinas.LEVE)
		Assert.assertEquals(44.44, usuario.calcularIMC(), 0.01)
	}

	@Test
	def void UsuarioDiabeticoSaludable() {
		val usuarioDiabeticoSaludable = new UsuarioPosta(83, 1.88, Rutinas.INTENSIVO)
		diabetico = new UsuarioDiabetico( usuarioDiabeticoSaludable )
		diabetico.estadoRutina()			
	}
	
	@Test (expected=RutinaNoSaludableExc)
	def void UsuarioDiabeticoNoSaludable()
	{
		val usuarioDiabeticoNoSaludable = new UsuarioPosta( 83, 1.88, Rutinas.LEVE )
		diabetico = new UsuarioDiabetico( usuarioDiabeticoNoSaludable )
		diabetico.estadoRutina()
	}
	
	@Test (expected=RutinaNoSaludableExc)
	def void UsuarioDiabeticoGordo()
	{
		val usuarioDiabeticoGordo = new UsuarioPosta( 100, 1.7, Rutinas.INTENSIVO )
		diabetico = new UsuarioDiabetico( usuarioDiabeticoGordo )
		diabetico.estadoRutina()
	}
	
	@Test
	def void UsuarioHipertensoSaludable()
	{
		val usuarioHipertensoSaludable = new UsuarioPosta(83, 1.88, Rutinas.INTENSIVO)
		hipertenso = new UsuarioHipertenso( usuarioHipertensoSaludable )
		hipertenso.estadoRutina()	
	}
	
	@Test (expected=RutinaNoSaludableExc)
	def void UsuarioHipertensoNoSaludable()
	{
		val usuarioHipertensoNoSaludable = new UsuarioPosta( 83, 1.88, Rutinas.LEVE )
		hipertenso = new UsuarioHipertenso( usuarioHipertensoNoSaludable )
		hipertenso.estadoRutina()
	}
	
	@Test (expected=RutinaNoSaludableExc)
	def void UsuarioHipertensoGordo()
	{
		val usuarioHipertensoGordo = new UsuarioPosta( 100, 1.7, Rutinas.INTENSIVO )
		hipertenso = new UsuarioHipertenso( usuarioHipertensoGordo )
		hipertenso.estadoRutina()
	}
}
