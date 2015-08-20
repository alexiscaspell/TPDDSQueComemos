package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Observador;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Recetario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioDecorator;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

@SuppressWarnings("all")
public class UsuarioHipertenso extends UsuarioDecorator {
  public UsuarioHipertenso(final Usuario decorado) {
    super(decorado);
  }
  
  public boolean estadoRutina() {
    boolean _and = false;
    Usuario _decorado = this.getDecorado();
    Rutina _rutina = _decorado.getRutina();
    boolean _rutinaActivaConEjercicioAdicional = _rutina.rutinaActivaConEjercicioAdicional();
    if (!_rutinaActivaConEjercicioAdicional) {
      _and = false;
    } else {
      Usuario _decorado_1 = this.getDecorado();
      boolean _estadoRutina = _decorado_1.estadoRutina();
      _and = _estadoRutina;
    }
    return _and;
  }
  
  public boolean usuarioValido() {
    boolean _and = false;
    Usuario _decorado = this.getDecorado();
    List<Ingrediente> _preferenciasAlimenticias = _decorado.getPreferenciasAlimenticias();
    int _size = _preferenciasAlimenticias.size();
    boolean _greaterThan = (_size > 0);
    if (!_greaterThan) {
      _and = false;
    } else {
      Usuario _decorado_1 = this.getDecorado();
      boolean _usuarioValido = _decorado_1.usuarioValido();
      _and = _usuarioValido;
    }
    return _and;
  }
  
  public boolean cumpleCondicion(final Receta receta) {
    Map<Condimento, Integer> _condimentos = receta.getCondimentos();
    boolean _containsKey = _condimentos.containsKey(Condimento.SAL);
    return (!_containsKey);
  }
  
  public void notificar() {
    ArrayList<Observador> _observadores = this.getObservadores();
    final Consumer<Observador> _function = new Consumer<Observador>() {
      public void accept(final Observador it) {
        it.actualizar(UsuarioHipertenso.this);
      }
    };
    _observadores.forEach(_function);
  }
  
  public List<Receta> getRecetasConAcceso() {
    final Recetario recetario = Recetario.getInstance();
    final List<Receta> recetas = recetario.listarTodas();
    List<Receta> _consultas = this.getConsultas();
    _consultas.clear();
    final Consumer<Receta> _function = new Consumer<Receta>() {
      public void accept(final Receta receta) {
        boolean _puedeVer = receta.puedeVer(UsuarioHipertenso.this);
        if (_puedeVer) {
          List<Receta> _consultas = UsuarioHipertenso.this.getConsultas();
          _consultas.add(receta);
        }
      }
    };
    recetas.forEach(_function);
    this.notificar();
    return this.getConsultas();
  }
  
  public boolean esVegano() {
    boolean _or = false;
    if (false) {
      _or = true;
    } else {
      Usuario _decorado = this.getDecorado();
      boolean _esVegano = _decorado.esVegano();
      _or = _esVegano;
    }
    return _or;
  }
  
  public boolean esHipertenso() {
    return true;
  }
  
  public boolean esDiabetico() {
    boolean _or = false;
    if (false) {
      _or = true;
    } else {
      Usuario _decorado = this.getDecorado();
      boolean _esDiabetico = _decorado.esDiabetico();
      _or = _esDiabetico;
    }
    return _or;
  }
  
  public Boolean cumpleMismasCondiciones(final Usuario usuario) {
    boolean _and = false;
    boolean _esHipertenso = usuario.esHipertenso();
    if (!_esHipertenso) {
      _and = false;
    } else {
      Usuario _decorado = this.getDecorado();
      Boolean _cumpleMismasCondiciones = _decorado.cumpleMismasCondiciones(usuario);
      _and = (_cumpleMismasCondiciones).booleanValue();
    }
    return Boolean.valueOf(_and);
  }
  
  public Usuario crearPerfil() {
    Usuario _decorado = this.getDecorado();
    Usuario _crearPerfil = _decorado.crearPerfil();
    final UsuarioHipertenso usuarioCopia = new UsuarioHipertenso(_crearPerfil);
    return usuarioCopia;
  }
  
  public List<Receta> getRecetasBuscadasFavoritas() {
    return null;
  }
}
