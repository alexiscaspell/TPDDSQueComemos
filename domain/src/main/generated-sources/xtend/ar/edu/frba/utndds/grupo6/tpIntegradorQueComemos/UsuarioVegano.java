package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Observador;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Recetario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioDecorator;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.MapExtensions;

@SuppressWarnings("all")
public class UsuarioVegano extends UsuarioDecorator {
  public UsuarioVegano(final Usuario decorado) {
    super(decorado);
  }
  
  public boolean estadoRutina() {
    boolean _and = false;
    Usuario _decorado = this.getDecorado();
    List<Ingrediente> _preferenciasAlimenticias = _decorado.getPreferenciasAlimenticias();
    final Function1<Ingrediente, Boolean> _function = new Function1<Ingrediente, Boolean>() {
      public Boolean apply(final Ingrediente ingrediente) {
        return Boolean.valueOf(ingrediente.contieneFruta());
      }
    };
    boolean _exists = IterableExtensions.<Ingrediente>exists(_preferenciasAlimenticias, _function);
    if (!_exists) {
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
    final Function1<Ingrediente, Boolean> _function = new Function1<Ingrediente, Boolean>() {
      public Boolean apply(final Ingrediente ingrediente) {
        return Boolean.valueOf(ingrediente.contieneCarne());
      }
    };
    boolean _exists = IterableExtensions.<Ingrediente>exists(_preferenciasAlimenticias, _function);
    boolean _not = (!_exists);
    if (!_not) {
      _and = false;
    } else {
      Usuario _decorado_1 = this.getDecorado();
      boolean _usuarioValido = _decorado_1.usuarioValido();
      _and = _usuarioValido;
    }
    return _and;
  }
  
  public boolean cumpleCondicion(final Receta receta) {
    Map<Ingrediente, Integer> _ingredientes = receta.getIngredientes();
    final Function2<Ingrediente, Integer, Boolean> _function = new Function2<Ingrediente, Integer, Boolean>() {
      public Boolean apply(final Ingrediente condimento, final Integer cantidad) {
        return Boolean.valueOf(condimento.contieneCarne());
      }
    };
    Map<Ingrediente, Integer> _filter = MapExtensions.<Ingrediente, Integer>filter(_ingredientes, _function);
    int _size = _filter.size();
    return (_size == 0);
  }
  
  public void notificar() {
    ArrayList<Observador> _observadores = this.getObservadores();
    final Consumer<Observador> _function = new Consumer<Observador>() {
      public void accept(final Observador it) {
        it.actualizar(UsuarioVegano.this);
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
        boolean _puedeVer = receta.puedeVer(UsuarioVegano.this);
        if (_puedeVer) {
          List<Receta> _consultas = UsuarioVegano.this.getConsultas();
          _consultas.add(receta);
        }
      }
    };
    recetas.forEach(_function);
    this.notificar();
    return this.getConsultas();
  }
  
  public boolean esVegano() {
    return true;
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
    boolean _esVegano = usuario.esVegano();
    if (!_esVegano) {
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
    final UsuarioVegano usuarioCopia = new UsuarioVegano(_crearPerfil);
    return usuarioCopia;
  }
  
  public List<Receta> getRecetasBuscadasFavoritas() {
    return null;
  }
}
