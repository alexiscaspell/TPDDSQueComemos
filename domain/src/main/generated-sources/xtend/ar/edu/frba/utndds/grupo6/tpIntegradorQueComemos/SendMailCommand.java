package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Command;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.MailSender;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ResultadoConsulta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import com.google.common.base.Objects;
import queComemos.entrega3.dominio.Dificultad;

@SuppressWarnings("all")
public class SendMailCommand implements Command {
  private MailSender mailSender;
  
  public SendMailCommand(final MailSender mailSender) {
    this.mailSender = mailSender;
  }
  
  public void execute(final ResultadoConsulta resultado) {
    Usuario _usuario = resultado.getUsuario();
    String _email = _usuario.getEmail();
    Receta _recetaModelo = resultado.getRecetaModelo();
    String _CrearMensaje = this.CrearMensaje(_recetaModelo);
    this.mailSender.enviar(_email, _CrearMensaje);
  }
  
  public String CrearMensaje(final Receta receta) {
    final StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Parámetros de la Consulta:");
    String _nombre = receta.getNombre();
    boolean _notEquals = (!Objects.equal(_nombre, null));
    if (_notEquals) {
      String _nombre_1 = receta.getNombre();
      String _plus = ("Nombre: " + _nombre_1);
      stringBuilder.append(_plus);
    }
    int _anio = receta.getAnio();
    boolean _notEquals_1 = (_anio != 0);
    if (_notEquals_1) {
      int _anio_1 = receta.getAnio();
      String _plus_1 = ("Anio: " + Integer.valueOf(_anio_1));
      stringBuilder.append(_plus_1);
    }
    Dificultad _dificultad = receta.getDificultad();
    boolean _notEquals_2 = (!Objects.equal(_dificultad, null));
    if (_notEquals_2) {
      Dificultad _dificultad_1 = receta.getDificultad();
      String _plus_2 = ("Anio: " + _dificultad_1);
      stringBuilder.append(_plus_2);
    }
    String _explicacion = receta.getExplicacion();
    boolean _notEquals_3 = (!Objects.equal(_explicacion, null));
    if (_notEquals_3) {
      String _explicacion_1 = receta.getExplicacion();
      String _plus_3 = ("Explicacion: " + _explicacion_1);
      stringBuilder.append(_plus_3);
    }
    return stringBuilder.toString();
  }
}
