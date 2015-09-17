package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import static org.mockito.Mockito.*
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.text.DateFormat
import java.util.Date
import java.text.SimpleDateFormat

class CommandsTestSuite {
	
	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	Date fecha = format.parse("01-04-1970")
	
	@Test
	def void ConsultaDeRecetasCon1MailEnviado()
	{
		var mailSender = mock(typeof(MailSender));
		var sendMailCommand = new SendMailCommand(mailSender);		
		
		val recetario = Recetario.getInstance();
		recetario.sendMailCommand = sendMailCommand;
		
		val pepe = getUsuarioPepe();
		
		val recetaModelo = new Receta();
		recetaModelo.explicacion = "Explicacion";
		
		recetario.getRecetasQueCumplen(pepe, recetaModelo);
		
		verify(mailSender, times(1)).enviar(any(String), any(String));
	}
	
	private def getUsuarioPepe()
	{
		val pepe = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, fecha)		
		pepe
	}
}