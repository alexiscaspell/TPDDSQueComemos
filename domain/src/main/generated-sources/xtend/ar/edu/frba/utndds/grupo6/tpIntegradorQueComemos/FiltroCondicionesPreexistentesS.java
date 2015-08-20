package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.TipoDeFiltroS;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class FiltroCondicionesPreexistentesS implements TipoDeFiltroS {
  public List<Receta> aplicarFiltro(final List<Receta> recetasConocidas, final Usuario usuario) {
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta it) {
        ArrayList<Condicion> _condicionesInadecuadas = it.condicionesInadecuadas();
        Class<? extends Usuario> _class = usuario.getClass();
        String _name = _class.getName();
        return Boolean.valueOf(_condicionesInadecuadas.contains(_name));
      }
    };
    Iterable<Receta> _filter = IterableExtensions.<Receta>filter(recetasConocidas, _function);
    return IterableExtensions.<Receta>toList(_filter);
  }
}
