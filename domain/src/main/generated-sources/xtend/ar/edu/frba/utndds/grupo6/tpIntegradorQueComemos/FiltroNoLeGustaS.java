package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.TipoDeFiltroS;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class FiltroNoLeGustaS implements TipoDeFiltroS {
  public List<Receta> aplicarFiltro(final List<Receta> recetasConocidas, final Usuario usuario) {
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta it) {
        List<String> _platosQueNoLeGustan = usuario.getPlatosQueNoLeGustan();
        String _nombre = it.getNombre();
        boolean _contains = _platosQueNoLeGustan.contains(_nombre);
        return Boolean.valueOf((!_contains));
      }
    };
    Iterable<Receta> _filter = IterableExtensions.<Receta>filter(recetasConocidas, _function);
    return IterableExtensions.<Receta>toList(_filter);
  }
}
