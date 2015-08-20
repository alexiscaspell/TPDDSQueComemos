package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class ResultadoConsulta {
  private Receta recetaModelo;
  
  private List<Receta> recetasEncontradas;
  
  private Usuario usuario;
  
  public ResultadoConsulta(final Receta receta, final List<Receta> recetas, final Usuario usuario) {
    this.recetaModelo = receta;
    this.recetasEncontradas = recetas;
    this.usuario = usuario;
  }
  
  public int getCantidadRecetas() {
    return this.recetasEncontradas.size();
  }
  
  @Pure
  public Receta getRecetaModelo() {
    return this.recetaModelo;
  }
  
  public void setRecetaModelo(final Receta recetaModelo) {
    this.recetaModelo = recetaModelo;
  }
  
  @Pure
  public List<Receta> getRecetasEncontradas() {
    return this.recetasEncontradas;
  }
  
  public void setRecetasEncontradas(final List<Receta> recetasEncontradas) {
    this.recetasEncontradas = recetasEncontradas;
  }
  
  @Pure
  public Usuario getUsuario() {
    return this.usuario;
  }
  
  public void setUsuario(final Usuario usuario) {
    this.usuario = usuario;
  }
}
