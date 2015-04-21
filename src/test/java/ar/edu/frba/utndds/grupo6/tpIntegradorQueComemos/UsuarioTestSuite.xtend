package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import org.junit.Assert
import java.util.Date

class UsuarioTestSuite {

	Usuario diabetico
	Usuario hipertenso
	Usuario vegano
	
	@Test
	def void unTipoAlto() {
		val pepe = new UsuarioPosta(80.4, 1.90, Rutinas.LEVE,"pepe", Sexo.MASCULINO, new Date(1970,01,04))
		Assert.assertEquals(22.27, pepe.calcularIMC(), 0.01)
	}

	@Test
	def void testEnunciado() {
		val persona_enunciado = new UsuarioPosta(83, 1.88, Rutinas.LEVE, "persona_enunciado", Sexo.MASCULINO, new Date(1980,01,04))
		Assert.assertEquals(23.48, persona_enunciado.calcularIMC(), 0.01)
	}

	@Test
	def void unTipoGordo() {
		val jesus = new UsuarioPosta(100, 1.75, Rutinas.LEVE, "jesus", Sexo.MASCULINO, new Date(1980,01,04))
		Assert.assertEquals(32.65, jesus.calcularIMC(), 0.01)
	}

	@Test
	def void homeroSimpson() {
		val homero = new UsuarioPosta(113, 1.83, Rutinas.LEVE, "homero", Sexo.MASCULINO, new Date(1980,01,04))
		Assert.assertEquals(33.74, homero.calcularIMC(), 0.01)
	}

	
	@Test
	def void IMCDeUnUsuarioQueMide100YPesa150() {
		val usuario = new UsuarioPosta(100, 1.50, Rutinas.LEVE, "usuario", Sexo.MASCULINO, new Date(1980,01,04))
		Assert.assertEquals(44.44, usuario.calcularIMC(), 0.01)
	}

	@Test
	def void usuarioDiabeticoSaludable() {
		val usuarioDiabeticoSaludable = new UsuarioPosta(83, 1.88, Rutinas.INTENSIVO, "usuarioDiabeticoSaludable", Sexo.MASCULINO, new Date(1980,01,04))
		diabetico = new UsuarioDiabetico( usuarioDiabeticoSaludable )
		diabetico.estadoRutina()			
	}
	
	@Test (expected=RutinaNoSaludableExc)
	def void usuarioDiabeticoNoSaludable()
	{
		val usuarioDiabeticoNoSaludable = new UsuarioPosta( 83, 1.88, Rutinas.LEVE, "usuarioDiabeticoNoSaludable", Sexo.MASCULINO, new Date(1980,01,04) )
		diabetico = new UsuarioDiabetico( usuarioDiabeticoNoSaludable )
		diabetico.estadoRutina()
	}
	
	@Test (expected=RutinaNoSaludableExc)
	def void usuarioDiabeticoGordo()
	{
		val usuarioDiabeticoGordo = new UsuarioPosta( 100, 1.7, Rutinas.INTENSIVO, "usuarioDiabeticoGordo", Sexo.MASCULINO, new Date(1980,01,04))
		diabetico = new UsuarioDiabetico( usuarioDiabeticoGordo )
		diabetico.estadoRutina()
	}
	
	@Test
	def void usuarioHipertensoSaludable()
	{
		val usuarioHipertensoSaludable = new UsuarioPosta(83, 1.88, Rutinas.INTENSIVO, "usuarioHipertensoSaludable", Sexo.MASCULINO, new Date(1980,01,04))
		hipertenso = new UsuarioHipertenso( usuarioHipertensoSaludable )
		hipertenso.estadoRutina()	
	}
	
	@Test (expected=RutinaNoSaludableExc)
	def void usuarioHipertensoNoSaludable()
	{
		val usuarioHipertensoNoSaludable = new UsuarioPosta( 83, 1.88, Rutinas.LEVE, "usuarioHipertensoNoSaludable", Sexo.MASCULINO, new Date(1980,01,04) )
		hipertenso = new UsuarioHipertenso( usuarioHipertensoNoSaludable )
		hipertenso.estadoRutina()
	}
	
	@Test (expected=RutinaNoSaludableExc)
	def void usuarioHipertensoGordo()
	{
		val usuarioHipertensoGordo = new UsuarioPosta( 100, 1.7, Rutinas.INTENSIVO, "usuarioHipertensoGordo", Sexo.MASCULINO, new Date(1980,01,04) )
		hipertenso = new UsuarioHipertenso( usuarioHipertensoGordo )
		hipertenso.estadoRutina()
	}
	
	// Test Vegano valido con frutas
	// Test Vegano invalido sin frutas
	
	@Test (expected=RutinaNoSaludableExc)
	def void usuarioVeganoNoSaludable()
	{
		val usuarioVeganoNoSaludable = new UsuarioPosta( 100, 1.7, Rutinas.LEVE, "usuarioVeganoNoSaludable", Sexo.MASCULINO, new Date(1980,01,04) )
		vegano = new UsuarioVegano( usuarioVeganoNoSaludable )
		vegano.estadoRutina()
	}
	
}
