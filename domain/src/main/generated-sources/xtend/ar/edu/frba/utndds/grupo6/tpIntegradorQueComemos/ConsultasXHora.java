package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Observador;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

@SuppressWarnings("all")
public class ConsultasXHora implements Observador {
  private Map<Integer, Integer> consultasXHora = new HashMap<Integer, Integer>();
  
  private Calendar calendario = Calendar.getInstance();
  
  public void actualizar(final Usuario usuario) {
    int _get = this.calendario.get(Calendar.HOUR_OF_DAY);
    boolean _containsKey = this.consultasXHora.containsKey(Integer.valueOf(_get));
    if (_containsKey) {
      int _get_1 = this.calendario.get(Calendar.HOUR_OF_DAY);
      int _get_2 = this.calendario.get(Calendar.HOUR_OF_DAY);
      Integer _get_3 = this.consultasXHora.get(Integer.valueOf(_get_2));
      int _plus = ((_get_3).intValue() + 1);
      this.consultasXHora.put(Integer.valueOf(_get_1), Integer.valueOf(_plus));
    } else {
      int _get_4 = this.calendario.get(Calendar.HOUR_OF_DAY);
      this.consultasXHora.put(Integer.valueOf(_get_4), Integer.valueOf(1));
    }
  }
  
  public Map<Integer, Integer> getEstadistica() {
    return this.consultasXHora;
  }
  
  public void reset() {
    this.consultasXHora.clear();
  }
}
