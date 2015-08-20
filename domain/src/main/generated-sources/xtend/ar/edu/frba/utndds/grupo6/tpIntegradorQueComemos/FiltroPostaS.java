package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Filtro;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FiltroCarosS;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FiltroCondicionesPreexistentesS;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FiltroExcesoCaloriasS;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FiltroNoLeGustaS;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.TipoDeFiltroS;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("all")
public class FiltroPostaS extends Filtro {
  private List<TipoDeFiltroS> Filtros;
  
  private Integer contador = Integer.valueOf(0);
  
  public FiltroPostaS() {
    ArrayList<TipoDeFiltroS> _arrayList = new ArrayList<TipoDeFiltroS>();
    this.Filtros = _arrayList;
  }
  
  public void agregarFiltroNoLeGusta() {
    FiltroNoLeGustaS _filtroNoLeGustaS = new FiltroNoLeGustaS();
    this.Filtros.add(_filtroNoLeGustaS);
  }
  
  public void agregarFiltroExcesoCalorias() {
    FiltroExcesoCaloriasS _filtroExcesoCaloriasS = new FiltroExcesoCaloriasS();
    this.Filtros.add(_filtroExcesoCaloriasS);
  }
  
  public void agregarFiltroCondicionesPreexistentes() {
    FiltroCondicionesPreexistentesS _filtroCondicionesPreexistentesS = new FiltroCondicionesPreexistentesS();
    this.Filtros.add(_filtroCondicionesPreexistentesS);
  }
  
  public void agregarFiltroCaros() {
    FiltroCarosS _filtroCarosS = new FiltroCarosS();
    this.Filtros.add(_filtroCarosS);
  }
  
  public List<Receta> aplicarFiltro(final List<Receta> recetasConocidas, final Usuario usuario) {
    List<Receta> _xifexpression = null;
    int _size = this.Filtros.size();
    boolean _lessThan = ((this.contador).intValue() < _size);
    if (_lessThan) {
      List<Receta> _xblockexpression = null;
      {
        TipoDeFiltroS _get = this.Filtros.get((this.contador).intValue());
        final List<Receta> listaFiltrada = _get.aplicarFiltro(recetasConocidas, usuario);
        this.contador++;
        _xblockexpression = this.aplicarFiltro(listaFiltrada, usuario);
      }
      _xifexpression = _xblockexpression;
    } else {
      return recetasConocidas;
    }
    return _xifexpression;
  }
}
