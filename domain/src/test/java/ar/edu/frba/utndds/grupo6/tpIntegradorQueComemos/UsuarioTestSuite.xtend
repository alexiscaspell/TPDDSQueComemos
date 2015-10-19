package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import org.junit.Assert
import java.util.Date
import java.text.DateFormat
import java.text.SimpleDateFormat
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import java.util.HashMap
import java.util.ArrayList
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.TipoReceta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import queComemos.entrega3.dominio.Dificultad
import org.junit.Before
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.RecetasRepository

class UsuarioTestSuite {

	Usuario diabetico
	Usuario hipertenso
	Usuario vegano
	
	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	Date fecha = format.parse("01-04-1970")
	
	@Before
	def void SetUp()
	{
		//RecetasRepository.getInstance().reset();
	}

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
	
	@Test
	def void noPuedeComerUnVeganoDiabeticoPureConAzucar()
	{
		diabetico = new UsuarioDiabetico( getUsuarioPepe())
		vegano = new UsuarioVegano(diabetico)
		Assert.assertFalse(vegano.puedeComer(recetaPureConAzucar))		
	}
		
	@Test
	def void noPuedeComerUnVeganoMilanesas()
	{
		vegano = new UsuarioVegano( getUsuarioPepe())
		Assert.assertFalse(vegano.puedeComer(recetaMilanesas))		
	}
		
	@Test
	def void noPuedeComerUnHipertensoPureConSal()
	{
		hipertenso = new UsuarioHipertenso( getUsuarioPepe())
		Assert.assertFalse(hipertenso.puedeComer(recetaPureConSal))		
	}
		
	@Test
	def void puedeComerUnVeganoPureConSal()
	{
		vegano = new UsuarioVegano(usuarioPepe)
		Assert.assertTrue(vegano.puedeComer(recetaPureConSal))		
	}	
		
	@Test
	def void puedeComerUnDiabeticoPureConSal()
	{
		diabetico = new UsuarioDiabetico(usuarioPepe)
		Assert.assertTrue(diabetico.puedeComer(recetaPureConSal))		
	}
	
	@Test
	def void usuarioModificaUnaRecetaPropia()
	{
		var usuario = usuarioPepe
		var receta = getReceta(usuario, "Receta 1");
		RecetasRepository.getInstance().create(receta)
		
		usuario.modificarReceta("Receta 1", "Nuevo nombre", receta.ingredientes, receta.condimentos,
			receta.explicacion, receta.dificultad, receta.temporadas);
			
		Assert.assertEquals("Nuevo nombre", receta.nombre);
	}
	
	@Test
	def void usuarioModificaUnaRecetaNoPropia()
	{
		var usuario = usuarioPepe
		var usuario1 = usuarioPancho
		var receta = getReceta(usuario1, "Receta 1");
		receta.tipo = TipoReceta.PUBLICA;
		RecetasRepository.getInstance().create(receta)
		
		usuario.modificarReceta("Receta 1", "Nuevo nombre", receta.ingredientes, receta.condimentos,
			receta.explicacion, receta.dificultad, receta.temporadas);
		
		//El nombre de la receta en el Recetario no cambia	
		Assert.assertEquals("Receta 1", receta.nombre);
		
		//El usuario ahora tiene una receta con el nombre nuevo
		Assert.assertTrue(usuario.recetas.exists[rec | rec.nombre.equals("Nuevo nombre")])
	}
	
	@Test
	def void recetasQuePuedeVerUnUsuario()
	{
		val usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE,"Juan Carlos Lopez",Sexo.MASCULINO,fecha)
				
		val recetario = RecetasRepository.getInstance()
		
		recetario.create(getReceta(usuario, "Pure"))
		
		Assert.assertEquals(usuario.getRecetasConAcceso().size, 13)
	}
	
	@Test
	def void recetasQuePuedeVerUnUsuarioConGrupo()
	{
		val usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE,"Juan Carlos Lopez",Sexo.MASCULINO,fecha)
		val pepe = getUsuarioPepe()
		val grupo = new Grupo()
		grupo.agregar(usuario)
		grupo.agregar(pepe)		
		
		val recetario = RecetasRepository.getInstance()
		recetario.create(getReceta(pepe, "Receta1"))
		
		Assert.assertEquals(usuario.getRecetasConAcceso().size, 13)
	}
	
	private def Receta getRecetaPureConSal()
	{	
		val usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE,"Juan Carlos Lopez",Sexo.MASCULINO,fecha)
		val nombre = "Pure"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.PAPA, 1000)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.SAL, 10)
		condimentos.put(Condimento.ACEITE, 10)
		//condimentos.put(Condimento.AZUCAR, 100)
		val explicacion = "1 - Pelar las papas\n" + 
						  "2 - Hervir las papas 20 minutos" +
						  "3 - Pisar las papas con un pisapapas" +
						  "4 - Condimentar"
		val temporadas = new ArrayList<Temporada>()		
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)						  
		val recetaSimple = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple
	}
	
	private def Receta getRecetaPureConAzucar()
	{	
		val usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE,"Juan Carlos Lopez",Sexo.MASCULINO,fecha)
		val nombre = "Pure"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.PAPA, 1000)
		val condimentos = new HashMap<Condimento, Integer>()
		//condimentos.put(Condimento.SAL, 10)
		condimentos.put(Condimento.ACEITE, 10)
		condimentos.put(Condimento.AZUCAR, 100)
		val explicacion = "1 - Pelar las papas\n" + 
						  "2 - Hervir las papas 20 minutos" +
						  "3 - Pisar las papas con un pisapapas" +
						  "4 - Condimentar"
		val temporadas = new ArrayList<Temporada>()		
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)						  
		val recetaSimple = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple
	}

	private def Receta getRecetaMilanesas()
	{
		val usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE,"Juan Carlos Lopez",Sexo.MASCULINO,fecha)
		val nombre = "Milanesas"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.CARNE, 1000)
		ingredientes.put(Ingrediente.HUEVO, 6)
		ingredientes.put(Ingrediente.PAN_RAYADO, 6)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.SAL, 10)
		condimentos.put(Condimento.ACEITE, 10)		
		val explicacion = "1 - Cortar la carne\n" + 
						  "2 - Pasar la carne por el huevo" +
						  "3 - Pasar la carne por pan rayado" +
						  "4 - Hornear 25 minutos"
		val temporadas = new ArrayList<Temporada>()		
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)						  
		val recetaSimple = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple
	}
	
	private def Receta getReceta(Usuario usuario, String nombre)
	{
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.PAPA, 1000)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.SAL, 10)
		condimentos.put(Condimento.ACEITE, 10)
		val explicacion = "1 - Pelar las papas\n" + 
						  "2 - Hervir las papas 20 minutos" +
						  "3 - Pisar las papas con un pisapapas" +
						  "4 - Condimentar"
		val temporadas = new ArrayList<Temporada>()		
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)						  
		val receta = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		receta.tipo = TipoReceta.PRIVADA;
		receta
	}
	
	private def getUsuarioPepe(){
		val pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)		
		pepe
	}
	
	private def getUsuarioPancho(){
		val pancho = new UsuarioPosta(90.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Francisco Jose Lopez",Sexo.MASCULINO,fecha)		
		pancho
	}
}