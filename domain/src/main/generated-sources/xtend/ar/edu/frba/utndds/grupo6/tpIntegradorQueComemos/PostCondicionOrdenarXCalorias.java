package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ComparatorXCalorias;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.PostCondiciones;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import java.util.Collections;
import java.util.List;

@SuppressWarnings("all")
public class PostCondicionOrdenarXCalorias implements PostCondiciones {
  public List<Receta> aplicarPostCondicion(final List<Receta> recetas) {
    ComparatorXCalorias _comparatorXCalorias = new ComparatorXCalorias();
    Collections.<Receta>sort(recetas, _comparatorXCalorias);
    return recetas;
  }
}
