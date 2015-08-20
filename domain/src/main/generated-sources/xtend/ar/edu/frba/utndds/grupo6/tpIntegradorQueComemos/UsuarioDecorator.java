package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Consumidor;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Grupo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Recetario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.SujetoObservado;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public abstract class UsuarioDecorator extends SujetoObservado implements Usuario, Consumidor {
  private Usuario decorado;
  
  private Recetario recetario;
  
  public UsuarioDecorator(final Usuario usuario) {
    Recetario _instance = Recetario.getInstance();
    this.recetario = _instance;
    this.decorado = usuario;
  }
  
  public void setNombre(final String nombre) {
    this.decorado.setNombre(nombre);
  }
  
  public double getPeso() {
    return this.decorado.getPeso();
  }
  
  public String getEmail() {
    return this.decorado.getEmail();
  }
  
  public String getNombre() {
    return this.decorado.getNombre();
  }
  
  public List<Receta> getConsultas() {
    return this.decorado.getConsultas();
  }
  
  public List<String> getPlatosQueNoLeGustan() {
    return this.decorado.getPlatosQueNoLeGustan();
  }
  
  public List<Ingrediente> getPreferenciasAlimenticias() {
    return this.decorado.getPreferenciasAlimenticias();
  }
  
  public Sexo getSexo() {
    return this.decorado.getSexo();
  }
  
  public Rutina getRutina() {
    return this.decorado.getRutina();
  }
  
  public List<Receta> getRecetas() {
    return this.decorado.getRecetas();
  }
  
  public boolean usuarioValido() {
    return this.decorado.usuarioValido();
  }
  
  public boolean comparteGrupo(final Usuario usuario) {
    return this.decorado.comparteGrupo(usuario);
  }
  
  public boolean puedeComer(final Receta receta) {
    boolean _and = false;
    boolean _cumpleCondicion = this.cumpleCondicion(receta);
    if (!_cumpleCondicion) {
      _and = false;
    } else {
      boolean _puedeComer = this.decorado.puedeComer(receta);
      _and = _puedeComer;
    }
    return _and;
  }
  
  public abstract boolean cumpleCondicion(final Receta receta);
  
  public boolean sePuedeSugerir(final Receta receta) {
    boolean _and = false;
    boolean _puedeComer = this.puedeComer(receta);
    if (!_puedeComer) {
      _and = false;
    } else {
      boolean _sePuedeSugerir = this.decorado.sePuedeSugerir(receta);
      _and = _sePuedeSugerir;
    }
    return _and;
  }
  
  public void agregarGrupo(final Grupo grupo) {
    this.decorado.agregarGrupo(grupo);
  }
  
  @Pure
  public Usuario getDecorado() {
    return this.decorado;
  }
  
  public void setDecorado(final Usuario decorado) {
    this.decorado = decorado;
  }
  
  @Pure
  public Recetario getRecetario() {
    return this.recetario;
  }
  
  public void setRecetario(final Recetario recetario) {
    this.recetario = recetario;
  }
}
