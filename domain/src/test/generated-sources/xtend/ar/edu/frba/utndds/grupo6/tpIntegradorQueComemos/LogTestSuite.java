package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.LoggerCommand;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ResultadoConsulta;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.mockito.Matchers;
import org.mockito.Mockito;
import org.mockito.stubbing.OngoingStubbing;
import org.mockito.verification.VerificationMode;

@SuppressWarnings("all")
public class LogTestSuite {
  private List<Receta> recetasEncontradas = new ArrayList<Receta>();
  
  @Test
  public void ConsultaQueSeLoguea() {
    ResultadoConsulta consultaMasDe100 = Mockito.<ResultadoConsulta>mock(ResultadoConsulta.class);
    consultaMasDe100.setRecetasEncontradas(this.recetasEncontradas);
    int _cantidadRecetas = consultaMasDe100.getCantidadRecetas();
    OngoingStubbing<Integer> _when = Mockito.<Integer>when(Integer.valueOf(_cantidadRecetas));
    Integer _integer = new Integer(101);
    _when.thenReturn(_integer);
    Logger mockedLogger = Mockito.<Logger>mock(Logger.class);
    LoggerCommand LoggerCommand = new ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.LoggerCommand();
    LoggerCommand.setLogger(mockedLogger);
    LoggerCommand.execute(consultaMasDe100);
    VerificationMode _times = Mockito.times(1);
    Logger _verify = Mockito.<Logger>verify(mockedLogger, _times);
    String _any = Matchers.<String>any(String.class);
    _verify.info(_any);
  }
  
  @Test
  public void ConsultaQueNoSeLoguea() {
    ResultadoConsulta consultaMasDe100 = Mockito.<ResultadoConsulta>mock(ResultadoConsulta.class);
    consultaMasDe100.setRecetasEncontradas(this.recetasEncontradas);
    int _cantidadRecetas = consultaMasDe100.getCantidadRecetas();
    OngoingStubbing<Integer> _when = Mockito.<Integer>when(Integer.valueOf(_cantidadRecetas));
    Integer _integer = new Integer(99);
    _when.thenReturn(_integer);
    Logger mockedLogger = Mockito.<Logger>mock(Logger.class);
    LoggerCommand LoggerCommand = new ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.LoggerCommand();
    LoggerCommand.setLogger(mockedLogger);
    LoggerCommand.execute(consultaMasDe100);
    VerificationMode _times = Mockito.times(0);
    Logger _verify = Mockito.<Logger>verify(mockedLogger, _times);
    String _any = Matchers.<String>any(String.class);
    _verify.info(_any);
  }
}
