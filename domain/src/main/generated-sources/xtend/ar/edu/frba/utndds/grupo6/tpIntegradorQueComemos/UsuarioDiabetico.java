package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Observador;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Recetario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioDecorator;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

@SuppressWarnings("all")
public class UsuarioDiabetico extends UsuarioDecorator {
  public UsuarioDiabetico(final Usuario decorado) {
    super(decorado);
  }
  
  public boolean estadoRutina() {
    boolean _and = false;
    boolean _or = false;
    Usuario _decorado = this.getDecorado();
    double _peso = _decorado.getPeso();
    boolean _lessThan = (_peso < 70);
    if (_lessThan) {
      _or = true;
    } else {
      Usuario _decorado_1 = this.getDecorado();
      Rutina _rutina = _decorado_1.getRutina();
      boolean _rutinaActiva = _rutina.rutinaActiva();
      _or = _rutinaActiva;
    }
    if (!_or) {
      _and = false;
    } else {
      Usuario _decorado_2 = this.getDecorado();
      boolean _estadoRutina = _decorado_2.estadoRutina();
      _and = _estadoRutina;
    }
    return _and;
  }
  
  public boolean usuarioValido() {
    boolean _and = false;
    boolean _and_1 = false;
    Usuario _decorado = this.getDecorado();
    List<Ingrediente> _preferenciasAlimenticias = _decorado.getPreferenciasAlimenticias();
    int _size = _preferenciasAlimenticias.size();
    boolean _greaterThan = (_size > 0);
    if (!_greaterThan) {
      _and_1 = false;
    } else {
      Usuario _decorado_1 = this.getDecorado();
      Sexo _sexo = _decorado_1.getSexo();
      boolean _notEquals = (!Objects.equal(_sexo, null));
      _and_1 = _notEquals;
    }
    if (!_and_1) {
      _and = false;
    } else {
      Usuario _decorado_2 = this.getDecorado();
      boolean _usuarioValido = _decorado_2.usuarioValido();
      _and = _usuarioValido;
    }
    return _and;
  }
  
  public boolean cumpleCondicion(final Receta receta) {
    int _cantidadDeAzucar = receta.cantidadDeAzucar();
    return (_cantidadDeAzucar == 0);
  }
  
  public void notificar() {
    ArrayList<Observador> _observadores = this.getObservadores();
    final Consumer<Observador> _function = new Consumer<Observador>() {
      public void accept(final Observador it) {
        it.actualizar(UsuarioDiabetico.this);
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
        boolean _puedeVer = receta.puedeVer(UsuarioDiabetico.this);
        if (_puedeVer) {
          List<Receta> _consultas = UsuarioDiabetico.this.getConsultas();
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
    boolean _or = false;
    if (false) {
      _or = true;
    } else {
      Usuario _decorado = this.getDecorado();
      boolean _esHipertenso = _decorado.esHipertenso();
      _or = _esHipertenso;
    }
    return _or;
  }
  
  public boolean esDiabetico() {
    return true;
  }
  
  public Boolean cumpleMismasCondiciones(final Usuario usuario) {
    boolean _and = false;
    boolean _esDiabetico = usuario.esDiabetico();
    if (!_esDiabetico) {
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
    final UsuarioDiabetico usuarioCopia = new UsuarioDiabetico(_crearPerfil);
    return usuarioCopia;
  }
  
  public List<Receta> getRecetasBuscadasFavoritas() {
    return null;
  }
}
