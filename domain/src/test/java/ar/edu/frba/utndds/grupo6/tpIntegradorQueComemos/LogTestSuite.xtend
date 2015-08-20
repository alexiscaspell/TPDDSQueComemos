package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import static org.mockito.Mockito.*
import java.util.List
import java.util.ArrayList
import org.apache.log4j.Logger

class LogTestSuite {

	 List<Receta> recetasEncontradas = new ArrayList<Receta>
	 
	 @Test 
	 def void ConsultaQueSeLoguea(){
	 	var ResultadoConsulta consultaMasDe100 = mock(typeof(ResultadoConsulta))
		consultaMasDe100.recetasEncontradas = recetasEncontradas
		when(consultaMasDe100.cantidadRecetas).thenReturn(new Integer(101))
	 	
		var mockedLogger = mock(typeof(Logger))
		var LoggerCommand = new LoggerCommand
		LoggerCommand.logger = mockedLogger 
		
		LoggerCommand.execute( consultaMasDe100 )
		
		verify( mockedLogger , times(1)).info(any(typeof(String)))
	 }
	 
	 @Test
	 def void ConsultaQueNoSeLoguea(){
	 	var ResultadoConsulta consultaMasDe100 = mock(typeof(ResultadoConsulta))
		consultaMasDe100.recetasEncontradas = recetasEncontradas
		when(consultaMasDe100.cantidadRecetas).thenReturn(new Integer(99))
	 	
		var mockedLogger = mock(typeof(Logger))
		var LoggerCommand = new LoggerCommand
		LoggerCommand.logger = mockedLogger 
		
		LoggerCommand.execute( consultaMasDe100 )
		
		verify( mockedLogger , times(0)).info(any(typeof(String)))
	 }
	 
	
}