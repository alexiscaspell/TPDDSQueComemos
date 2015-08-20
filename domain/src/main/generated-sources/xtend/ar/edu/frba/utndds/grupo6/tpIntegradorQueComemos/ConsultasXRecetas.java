package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Observador;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

@SuppressWarnings("all")
public class ConsultasXRecetas implements Observador {
  private Map<String, Integer> recetasConsultadas = new HashMap<String, Integer>();
  
  public void actualizar(final Usuario usuario) {
    List<Receta> _consultas = usuario.getConsultas();
    final Consumer<Receta> _function = new Consumer<Receta>() {
      public void accept(final Receta it) {
        String _nombre = it.getNombre();
        boolean _containsKey = ConsultasXRecetas.this.recetasConsultadas.containsKey(_nombre);
        boolean _not = (!_containsKey);
        if (_not) {
          String _nombre_1 = it.getNombre();
          ConsultasXRecetas.this.recetasConsultadas.put(_nombre_1, Integer.valueOf(1));
        } else {
          String _nombre_2 = it.getNombre();
          String _nombre_3 = it.getNombre();
          Integer _get = ConsultasXRecetas.this.recetasConsultadas.get(_nombre_3);
          int _plus = ((_get).intValue() + 1);
          ConsultasXRecetas.this.recetasConsultadas.put(_nombre_2, Integer.valueOf(_plus));
        }
      }
    };
    _consultas.forEach(_function);
  }
  
  public Map<String, Integer> getEstadistica() {
    return this.recetasConsultadas;
  }
  
  public void reset() {
    this.recetasConsultadas.getClass();
  }
}
