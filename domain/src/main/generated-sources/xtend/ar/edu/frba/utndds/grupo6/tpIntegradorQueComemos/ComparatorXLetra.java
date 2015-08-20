package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import java.util.Comparator;

@SuppressWarnings("all")
public class ComparatorXLetra implements Comparator<Receta> {
  public int compare(final Receta r1, final Receta r2) {
    String _nombre = r1.getNombre();
    String _nombre_1 = r2.getNombre();
    return _nombre.compareTo(_nombre_1);
  }
}
