package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.PostCondicion10Primeros;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.PostCondicionOrdenarXCalorias;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.PostCondicionOrdenarXLetra;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.PostCondicionPares;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.PostCondiciones;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import com.google.common.base.Objects;
import java.util.List;

@SuppressWarnings("all")
public class PostCondicionPosta implements PostCondiciones {
  private PostCondiciones postCondicion;
  
  public void setPostCondicion10Primeros() {
    PostCondicion10Primeros _postCondicion10Primeros = new PostCondicion10Primeros();
    this.postCondicion = _postCondicion10Primeros;
  }
  
  public void setPostCondicionOrdenarXLetra() {
    PostCondicionOrdenarXLetra _postCondicionOrdenarXLetra = new PostCondicionOrdenarXLetra();
    this.postCondicion = _postCondicionOrdenarXLetra;
  }
  
  public void setPostCondicionOrdenarXCalorias() {
    PostCondicionOrdenarXCalorias _postCondicionOrdenarXCalorias = new PostCondicionOrdenarXCalorias();
    this.postCondicion = _postCondicionOrdenarXCalorias;
  }
  
  public void setPostCondicionPares() {
    PostCondicionPares _postCondicionPares = new PostCondicionPares();
    this.postCondicion = _postCondicionPares;
  }
  
  public List<Receta> aplicarPostCondicion(final List<Receta> recetas) {
    List<Receta> _xifexpression = null;
    boolean _notEquals = (!Objects.equal(this.postCondicion, null));
    if (_notEquals) {
      _xifexpression = this.postCondicion.aplicarPostCondicion(recetas);
    } else {
      return recetas;
    }
    return _xifexpression;
  }
}
