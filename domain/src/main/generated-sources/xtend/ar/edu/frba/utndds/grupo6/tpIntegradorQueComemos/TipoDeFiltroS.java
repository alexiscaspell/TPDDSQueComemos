package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.List;

@SuppressWarnings("all")
public interface TipoDeFiltroS {
  public abstract List<Receta> aplicarFiltro(final List<Receta> recetasConocidas, final Usuario usuario);
}
