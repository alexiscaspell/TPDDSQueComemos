package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Observador;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import com.google.common.base.Objects;
import java.util.List;
import java.util.function.Consumer;
import queComemos.entrega3.dominio.Dificultad;

@SuppressWarnings("all")
public class ConsultasXVeganos implements Observador {
  private int consultasXVeganos = 0;
  
  public void actualizar(final Usuario usuario) {
    boolean _esVegano = usuario.esVegano();
    if (_esVegano) {
      List<Receta> _consultas = usuario.getConsultas();
      final Consumer<Receta> _function = new Consumer<Receta>() {
        public void accept(final Receta it) {
          Dificultad _dificultad = it.getDificultad();
          boolean _equals = Objects.equal(_dificultad, Dificultad.DIFICIL);
          if (_equals) {
            ConsultasXVeganos.this.consultasXVeganos++;
          }
        }
      };
      _consultas.forEach(_function);
    }
  }
  
  public int getEstadistica() {
    return this.consultasXVeganos;
  }
  
  public void reset() {
    this.consultasXVeganos = 0;
  }
}
