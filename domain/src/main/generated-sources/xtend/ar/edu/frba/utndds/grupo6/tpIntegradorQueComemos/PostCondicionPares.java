package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.PostCondiciones;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class PostCondicionPares implements PostCondiciones {
  public List<Receta> aplicarPostCondicion(final List<Receta> recetas) {
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta it) {
        int _indexOf = recetas.indexOf(it);
        int _modulo = (_indexOf % 2);
        return Boolean.valueOf((_modulo == 0));
      }
    };
    Iterable<Receta> _filter = IterableExtensions.<Receta>filter(recetas, _function);
    return IterableExtensions.<Receta>toList(_filter);
  }
}
