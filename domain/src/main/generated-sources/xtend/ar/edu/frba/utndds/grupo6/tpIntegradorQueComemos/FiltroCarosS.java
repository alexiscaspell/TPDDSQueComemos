package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.TipoDeFiltroS;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class FiltroCarosS implements TipoDeFiltroS {
  public List<Receta> aplicarFiltro(final List<Receta> recetasConocidas, final Usuario usuario) {
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta it) {
        Map<Ingrediente, Integer> _ingredientes = it.getIngredientes();
        return Boolean.valueOf(FiltroCarosS.this.getSoloIngrediente(_ingredientes));
      }
    };
    Iterable<Receta> _filter = IterableExtensions.<Receta>filter(recetasConocidas, _function);
    return IterableExtensions.<Receta>toList(_filter);
  }
  
  public boolean getSoloIngrediente(final Map<Ingrediente, Integer> ingrediente) {
    Set<Ingrediente> _keySet = ingrediente.keySet();
    for (final Ingrediente key : _keySet) {
      boolean _esCaro = key.esCaro();
      if (_esCaro) {
        return false;
      }
    }
    return true;
  }
}
