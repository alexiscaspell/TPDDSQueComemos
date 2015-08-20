package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.MailSender;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Recetario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.SendMailCommand;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.junit.Test;
import org.mockito.Matchers;
import org.mockito.Mockito;
import org.mockito.verification.VerificationMode;

@SuppressWarnings("all")
public class CommandsTestSuite {
  private DateFormat format = new SimpleDateFormat("dd-mm-yyyy");
  
  private Date fecha = new Function0<Date>() {
    public Date apply() {
      try {
        Date _parse = CommandsTestSuite.this.format.parse("01-04-1970");
        return _parse;
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    }
  }.apply();
  
  @Test
  public void ConsultaDeRecetasCon1MailEnviado() {
    MailSender mailSender = Mockito.<MailSender>mock(MailSender.class);
    SendMailCommand sendMailCommand = new SendMailCommand(mailSender);
    final Recetario recetario = Recetario.getInstance();
    recetario.setSendMailCommand(sendMailCommand);
    final UsuarioPosta pepe = this.getUsuarioPepe();
    final Receta recetaModelo = new Receta();
    recetaModelo.setExplicacion("Explicacion");
    recetario.getRecetasQueCumplen(pepe, recetaModelo);
    VerificationMode _times = Mockito.times(1);
    MailSender _verify = Mockito.<MailSender>verify(mailSender, _times);
    String _any = Matchers.<String>any(String.class);
    String _any_1 = Matchers.<String>any(String.class);
    _verify.enviar(_any, _any_1);
  }
  
  private UsuarioPosta getUsuarioPepe() {
    UsuarioPosta _xblockexpression = null;
    {
      final UsuarioPosta pepe = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
      _xblockexpression = pepe;
    }
    return _xblockexpression;
  }
}
