package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import java.util.List;

@SuppressWarnings("all")
public interface PostCondiciones {
  public abstract List<Receta> aplicarPostCondicion(final List<Receta> recetas);
}
