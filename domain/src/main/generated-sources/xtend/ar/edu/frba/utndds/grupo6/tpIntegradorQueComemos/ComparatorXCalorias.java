package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import java.util.Comparator;

@SuppressWarnings("all")
public class ComparatorXCalorias implements Comparator<Receta> {
  public int compare(final Receta r1, final Receta r2) {
    int _calorias = r1.getCalorias();
    int _calorias_1 = r2.getCalorias();
    return Integer.valueOf(_calorias).compareTo(Integer.valueOf(_calorias_1));
  }
}
