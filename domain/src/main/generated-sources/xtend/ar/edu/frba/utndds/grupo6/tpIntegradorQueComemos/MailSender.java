package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

@SuppressWarnings("all")
public interface MailSender {
  public abstract void enviar(final String para, final String mensaje);
}
