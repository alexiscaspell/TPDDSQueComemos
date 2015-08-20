package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Observador;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import com.google.common.base.Objects;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

@SuppressWarnings("all")
public class ConsultasXSexo implements Observador {
  private Map<String, Integer> consultasXFemenino = new HashMap<String, Integer>();
  
  private Map<String, Integer> consultasXMasculino = new HashMap<String, Integer>();
  
  public void actualizar(final Usuario usuario) {
    List<Receta> _consultas = usuario.getConsultas();
    final Consumer<Receta> _function = new Consumer<Receta>() {
      public void accept(final Receta it) {
        String _nombre = it.getNombre();
        boolean _containsKey = ConsultasXSexo.this.consultasXFemenino.containsKey(_nombre);
        boolean _not = (!_containsKey);
        if (_not) {
          String _nombre_1 = it.getNombre();
          ConsultasXSexo.this.consultasXFemenino.put(_nombre_1, Integer.valueOf(0));
        }
        String _nombre_2 = it.getNombre();
        boolean _containsKey_1 = ConsultasXSexo.this.consultasXMasculino.containsKey(_nombre_2);
        boolean _not_1 = (!_containsKey_1);
        if (_not_1) {
          String _nombre_3 = it.getNombre();
          ConsultasXSexo.this.consultasXMasculino.put(_nombre_3, Integer.valueOf(0));
        }
        Sexo _sexo = usuario.getSexo();
        boolean _equals = Objects.equal(_sexo, Sexo.FEMENINO);
        if (_equals) {
          String _nombre_4 = it.getNombre();
          String _nombre_5 = it.getNombre();
          Integer _get = ConsultasXSexo.this.consultasXFemenino.get(_nombre_5);
          int _plus = ((_get).intValue() + 1);
          ConsultasXSexo.this.consultasXFemenino.put(_nombre_4, Integer.valueOf(_plus));
        } else {
          String _nombre_6 = it.getNombre();
          String _nombre_7 = it.getNombre();
          Integer _get_1 = ConsultasXSexo.this.consultasXMasculino.get(_nombre_7);
          int _plus_1 = ((_get_1).intValue() + 1);
          ConsultasXSexo.this.consultasXMasculino.put(_nombre_6, Integer.valueOf(_plus_1));
        }
      }
    };
    _consultas.forEach(_function);
  }
  
  public Map<String, Integer> getEstadisticaFemenino() {
    return this.consultasXFemenino;
  }
  
  public Map<String, Integer> getEstadisticaMasculino() {
    return this.consultasXMasculino;
  }
  
  public void reset() {
    this.consultasXFemenino.clear();
    this.consultasXMasculino.clear();
  }
}
