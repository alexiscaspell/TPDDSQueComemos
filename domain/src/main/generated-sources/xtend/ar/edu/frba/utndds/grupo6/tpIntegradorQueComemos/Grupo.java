package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Consumidor;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@SuppressWarnings("all")
public class Grupo implements Consumidor {
  @Accessors
  private String nombre;
  
  @Accessors
  private List<Usuario> integrantes = new ArrayList<Usuario>();
  
  @Accessors
  private List<Receta> recetasPreferidas = new ArrayList<Receta>();
  
  public boolean contieneAlUsuario(final Usuario usuario) {
    return this.integrantes.contains(usuario);
  }
  
  public boolean sePuedeSugerir(final Receta receta) {
    boolean _and = false;
    boolean _puedeComer = this.puedeComer(receta);
    if (!_puedeComer) {
      _and = false;
    } else {
      boolean _esPreferida = this.esPreferida(receta);
      _and = _esPreferida;
    }
    return _and;
  }
  
  public boolean esPreferida(final Receta receta) {
    return receta.estaContenido(this.recetasPreferidas);
  }
  
  public boolean puedeComer(final Receta receta) {
    final Function1<Usuario, Boolean> _function = new Function1<Usuario, Boolean>() {
      public Boolean apply(final Usuario integrante) {
        return Boolean.valueOf(integrante.puedeComer(receta));
      }
    };
    return IterableExtensions.<Usuario>forall(this.integrantes, _function);
  }
  
  public void agregar(final Usuario usuario) {
    this.integrantes.add(usuario);
    usuario.agregarGrupo(this);
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public List<Usuario> getIntegrantes() {
    return this.integrantes;
  }
  
  public void setIntegrantes(final List<Usuario> integrantes) {
    this.integrantes = integrantes;
  }
  
  @Pure
  public List<Receta> getRecetasPreferidas() {
    return this.recetasPreferidas;
  }
  
  public void setRecetasPreferidas(final List<Receta> recetasPreferidas) {
    this.recetasPreferidas = recetasPreferidas;
  }
}
