package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.TipoDeFiltroS;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class FiltroExcesoCaloriasS implements TipoDeFiltroS {
  public List<Receta> aplicarFiltro(final List<Receta> recetasConocidas, final Usuario usuario) {
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta it) {
        int _calorias = it.getCalorias();
        return Boolean.valueOf((_calorias < 500));
      }
    };
    Iterable<Receta> _filter = IterableExtensions.<Receta>filter(recetasConocidas, _function);
    return IterableExtensions.<Receta>toList(_filter);
  }
}
