package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ComparatorXLetra;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.PostCondiciones;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import java.util.Collections;
import java.util.List;

@SuppressWarnings("all")
public class PostCondicionOrdenarXLetra implements PostCondiciones {
  public List<Receta> aplicarPostCondicion(final List<Receta> recetas) {
    ComparatorXLetra _comparatorXLetra = new ComparatorXLetra();
    Collections.<Receta>sort(recetas, _comparatorXLetra);
    return recetas;
  }
}
