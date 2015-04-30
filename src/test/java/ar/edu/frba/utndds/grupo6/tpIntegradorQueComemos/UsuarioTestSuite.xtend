package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import org.junit.Assert
import java.util.Date
import java.text.DateFormat
import java.text.SimpleDateFormat
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente

class UsuarioTestSuite {

	Usuario diabetico
	Usuario hipertenso
	Usuario vegano
	
	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	Date fecha = format.parse("01-04-1970")

	@Test
	def void unTipoAlto() {
		val pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		Assert.assertEquals(22.27, pepe.getIMC(), 0.01)
	}

	@Test
	def void testEnunciado() {
		val persona_enunciado = new UsuarioPosta(83,1.88,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		Assert.assertEquals(23.48, persona_enunciado.getIMC(), 0.01)
	}

	@Test
	def void unTipoGordo() {
		val jesus = new UsuarioPosta(100,1.75,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		Assert.assertEquals(32.65, jesus.getIMC(), 0.01)
	}

	@Test
	def void homeroSimpson() {
		val homero = new UsuarioPosta(113,1.83,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		Assert.assertEquals(33.74, homero.getIMC(), 0.01)
	}

	@Test
	def void IMCDeUnUsuarioQueMide100YPesa150() {
		val usuario = new UsuarioPosta(100,1.50,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		Assert.assertEquals(44.44, usuario.getIMC(), 0.01)
	}

	@Test
	def void usuarioDiabeticoSaludable() {
		val usuarioDiabeticoSaludable = new UsuarioPosta(82,1.78,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		diabetico = new UsuarioDiabetico( usuarioDiabeticoSaludable )
		Assert.assertTrue( diabetico.estadoRutina() ) 			
	}
	
	@Test 
	def void usuarioDiabeticoNoSaludable()
	{
		val usuarioDiabeticoNoSaludable = new UsuarioPosta(82,1.78,Rutina.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		diabetico = new UsuarioDiabetico( usuarioDiabeticoNoSaludable )
		Assert.assertFalse(diabetico.estadoRutina() )
	}
	
	@Test 
	def void usuarioDiabeticoGordo()
	{
		val usuarioDiabeticoGordo = new UsuarioPosta(100,1.78,Rutina.INTENSIVO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		diabetico = new UsuarioDiabetico( usuarioDiabeticoGordo )
		Assert.assertFalse(diabetico.estadoRutina() )
	}
	
	@Test
	def void usuarioHipertensoSaludable()
	{
		val usuarioHipertensoSaludable = new UsuarioPosta(82,1.78,Rutina.INTENSIVO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		hipertenso = new UsuarioHipertenso( usuarioHipertensoSaludable )
		Assert.assertTrue( hipertenso.estadoRutina() )	
	}
	
	@Test
	def void usuarioHipertensoNoSaludable()
	{
		val usuarioHipertensoNoSaludable = new UsuarioPosta(82,1.78,Rutina.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		hipertenso = new UsuarioHipertenso( usuarioHipertensoNoSaludable )
		Assert.assertFalse( hipertenso.estadoRutina() )
	}
	
	@Test 
	def void usuarioHipertensoGordo()
	{
		val usuarioHipertensoGordo = new UsuarioPosta(100,1.78,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		hipertenso = new UsuarioHipertenso( usuarioHipertensoGordo )
		Assert.assertFalse( hipertenso.estadoRutina() )
	}
	
	// Test Vegano valido con frutas
	@Test
	def void usuarioVeganoSaludable()
	{
		val usuarioVeganoNoSaludable = new UsuarioPosta(82,1.88,Rutina.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		vegano = new UsuarioVegano( usuarioVeganoNoSaludable )
		vegano.preferenciasAlimenticias.add(Ingrediente.FRUTA)
		Assert.assertTrue( vegano.estadoRutina() )
	}
	
	// Test Vegano invalido con frutas
	@Test 
	def void usuarioVeganoNoSaludable()
	{
		val usuarioVeganoNoSaludable = new UsuarioPosta(100,1.78,Rutina.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		vegano = new UsuarioVegano( usuarioVeganoNoSaludable )
		vegano.preferenciasAlimenticias.add(Ingrediente.FRUTA)
		Assert.assertFalse (vegano.estadoRutina() )
	}
	
	// Test Vegano invalido con frutas
	@Test
	def void usuarioVeganoGordo()
	{
		val usuarioVeganoNoSaludable = new UsuarioPosta(100,1.78,Rutina.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		vegano = new UsuarioVegano( usuarioVeganoNoSaludable )
		vegano.preferenciasAlimenticias.add(Ingrediente.FRUTA)
		Assert.assertFalse(vegano.estadoRutina() )
	}
	
	@Test
	def void usuarioVeganoValido(){
		val unUsuario = new UsuarioPosta(100,1.78,Rutina.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		unUsuario.preferenciasAlimenticias.add(Ingrediente.PAPA)
		vegano = new UsuarioVegano(unUsuario)
		Assert.assertTrue(vegano.usuarioValido())
	}
	
	@Test 
	def void usuarioVeganoNoValido()
	{
		val usuarioVeganoNoValido = new UsuarioPosta(100,1.78,Rutina.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)		
		usuarioVeganoNoValido.preferenciasAlimenticias.add(Ingrediente.POLLO)
		vegano = new UsuarioVegano(usuarioVeganoNoValido)
		
		Assert.assertFalse( vegano.usuarioValido() )
	} 
	
	@Test
	def void usuarioDiabeticoValido(){
		val unUsuario = new UsuarioPosta(100,1.78,Rutina.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		unUsuario.preferenciasAlimenticias.add(Ingrediente.PAPA)
		diabetico = new UsuarioDiabetico(unUsuario)
		Assert.assertTrue(diabetico.usuarioValido())
	}
	
	@Test 
	def void usuarioDiabeticoNoValido()
	{
		val usuarioDiabeticoNoValido = new UsuarioPosta(100,1.78,Rutina.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)		
		diabetico = new UsuarioDiabetico(usuarioDiabeticoNoValido)
		Assert.assertFalse( diabetico.usuarioValido() ) 
	} 
	
	@Test 
	def void usuarioHipertensoValido(){
		val unUsuario = new UsuarioPosta(100,1.78,Rutina.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		unUsuario.preferenciasAlimenticias.add(Ingrediente.PAPA)
		hipertenso = new UsuarioHipertenso(unUsuario)
		Assert.assertTrue(hipertenso.usuarioValido())
	}
	
	@Test 
	def void usuarioHipertensoNoValido()
	{
		val usuarioHipertensoNoValido = new UsuarioPosta(100,1.78,Rutina.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		hipertenso = new UsuarioHipertenso(usuarioHipertensoNoValido)
		Assert.assertFalse( hipertenso.usuarioValido() )
	} 
	
}