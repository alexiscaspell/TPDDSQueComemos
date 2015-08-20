package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Excepciones.RecetaInvalidaExc;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.IReceta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.TipoReceta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import queComemos.entrega3.dominio.Dificultad;

@SuppressWarnings("all")
public class Receta implements IReceta, Cloneable {
  @Accessors
  private Usuario usuarioCreador;
  
  @Accessors
  private String nombre;
  
  @Accessors
  private int anio;
  
  @Accessors
  private int tiempoPreparacion;
  
  @Accessors
  private Dificultad dificultad;
  
  @Accessors
  private List<Temporada> temporadas;
  
  @Accessors
  private TipoReceta tipo;
  
  @Accessors
  private Map<Ingrediente, Integer> ingredientes;
  
  @Accessors
  private Map<Condimento, Integer> condimentos;
  
  @Accessors
  private int calorias;
  
  @Accessors
  private String explicacion;
  
  private ArrayList<IReceta> subRecetas;
  
  public Receta(final Usuario usuario, final String nombre, final Map<Ingrediente, Integer> ingredientes, final Map<Condimento, Integer> condimentos, final String explicacion, final Dificultad dificultad, final ArrayList<Temporada> temporadas) {
    this.usuarioCreador = usuario;
    this.nombre = nombre;
    this.ingredientes = ingredientes;
    this.condimentos = condimentos;
    this.explicacion = explicacion;
    this.dificultad = dificultad;
    this.temporadas = temporadas;
    ArrayList<IReceta> _arrayList = new ArrayList<IReceta>();
    this.subRecetas = _arrayList;
  }
  
  public Receta() {
    ArrayList<IReceta> _arrayList = new ArrayList<IReceta>();
    this.subRecetas = _arrayList;
  }
  
  public void validar() {
    try {
      boolean _or = false;
      boolean _or_1 = false;
      Collection<Integer> _values = this.ingredientes.values();
      int _length = ((Object[])Conversions.unwrapArray(_values, Object.class)).length;
      boolean _equals = (_length == 0);
      if (_equals) {
        _or_1 = true;
      } else {
        int _calorias = this.getCalorias();
        boolean _lessThan = (_calorias < 5);
        _or_1 = _lessThan;
      }
      if (_or_1) {
        _or = true;
      } else {
        int _calorias_1 = this.getCalorias();
        boolean _greaterThan = (_calorias_1 > 5000);
        _or = _greaterThan;
      }
      if (_or) {
        throw new RecetaInvalidaExc();
      }
      final Consumer<IReceta> _function = new Consumer<IReceta>() {
        public void accept(final IReceta e) {
          e.validar();
        }
      };
      this.subRecetas.forEach(_function);
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public ArrayList<Condicion> condicionesInadecuadas() {
    final ArrayList<Condicion> condicionesInadecuadas = new ArrayList<Condicion>();
    boolean _or = false;
    boolean _containsKey = this.condimentos.containsKey(Condimento.SAL);
    if (_containsKey) {
      _or = true;
    } else {
      boolean _containsKey_1 = this.condimentos.containsKey(Condimento.CALDO);
      _or = _containsKey_1;
    }
    if (_or) {
      condicionesInadecuadas.add(Condicion.HIPERTENSO);
    }
    int _cantidadDeAzucar = this.cantidadDeAzucar();
    boolean _greaterThan = (_cantidadDeAzucar > 100);
    if (_greaterThan) {
      condicionesInadecuadas.add(Condicion.DIABETICO);
    }
    Set<Ingrediente> _keySet = this.ingredientes.keySet();
    final Function1<Ingrediente, Boolean> _function = new Function1<Ingrediente, Boolean>() {
      public Boolean apply(final Ingrediente x) {
        return Boolean.valueOf(x.contieneCarne());
      }
    };
    boolean _exists = IterableExtensions.<Ingrediente>exists(_keySet, _function);
    if (_exists) {
      condicionesInadecuadas.add(Condicion.VEGANO);
    }
    final Consumer<IReceta> _function_1 = new Consumer<IReceta>() {
      public void accept(final IReceta x) {
        ArrayList<Condicion> _condicionesInadecuadas = x.condicionesInadecuadas();
        condicionesInadecuadas.addAll(_condicionesInadecuadas);
      }
    };
    this.subRecetas.forEach(_function_1);
    return condicionesInadecuadas;
  }
  
  public int cantidadDeAzucar() {
    Integer _xblockexpression = null;
    {
      final Function1<IReceta, Boolean> _function = new Function1<IReceta, Boolean>() {
        public Boolean apply(final IReceta x) {
          Map<Condimento, Integer> _condimentos = x.getCondimentos();
          return Boolean.valueOf(_condimentos.containsKey(Condimento.AZUCAR));
        }
      };
      final Iterable<IReceta> recetasConAzucar = IterableExtensions.<IReceta>filter(this.subRecetas, _function);
      int _cantidadDeAzucarEnLosCondimentos = this.cantidadDeAzucarEnLosCondimentos();
      final Function2<Integer, IReceta, Integer> _function_1 = new Function2<Integer, IReceta, Integer>() {
        public Integer apply(final Integer acum, final IReceta receta) {
          int _cantidadDeAzucar = receta.cantidadDeAzucar();
          return Integer.valueOf(((acum).intValue() + _cantidadDeAzucar));
        }
      };
      _xblockexpression = IterableExtensions.<IReceta, Integer>fold(recetasConAzucar, Integer.valueOf(_cantidadDeAzucarEnLosCondimentos), _function_1);
    }
    return (_xblockexpression).intValue();
  }
  
  public Map<Ingrediente, Integer> getIngredientes() {
    Map<Ingrediente, Integer> _xblockexpression = null;
    {
      int _length = ((Object[])Conversions.unwrapArray(this.subRecetas, Object.class)).length;
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _length, true);
      for (final Integer i : _doubleDotLessThan) {
        {
          final IReceta receta = this.subRecetas.get((i).intValue());
          Map<Ingrediente, Integer> _ingredientes = receta.getIngredientes();
          this.ingredientes.putAll(_ingredientes);
        }
      }
      _xblockexpression = this.ingredientes;
    }
    return _xblockexpression;
  }
  
  public Map<Condimento, Integer> getCondimentos() {
    Map<Condimento, Integer> _xblockexpression = null;
    {
      int _length = ((Object[])Conversions.unwrapArray(this.subRecetas, Object.class)).length;
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _length, true);
      for (final Integer i : _doubleDotLessThan) {
        {
          final IReceta receta = this.subRecetas.get((i).intValue());
          Map<Condimento, Integer> _condimentos = receta.getCondimentos();
          this.condimentos.putAll(_condimentos);
        }
      }
      _xblockexpression = this.condimentos;
    }
    return _xblockexpression;
  }
  
  public String getExplicacion() {
    String _xblockexpression = null;
    {
      final String explicacion = "";
      final Consumer<IReceta> _function = new Consumer<IReceta>() {
        public void accept(final IReceta receta) {
          String _explicacion = receta.getExplicacion();
          String.join(explicacion, _explicacion);
        }
      };
      this.subRecetas.forEach(_function);
      _xblockexpression = String.join(explicacion, this.explicacion);
    }
    return _xblockexpression;
  }
  
  public int getCalorias() {
    final Function2<Integer, IReceta, Integer> _function = new Function2<Integer, IReceta, Integer>() {
      public Integer apply(final Integer acum, final IReceta receta) {
        int _calorias = receta.getCalorias();
        return Integer.valueOf(((acum).intValue() + _calorias));
      }
    };
    return (int) IterableExtensions.<IReceta, Integer>fold(this.subRecetas, Integer.valueOf(this.calorias), _function);
  }
  
  public boolean puedeModificar(final Usuario usuario) {
    boolean _or = false;
    boolean _equals = this.usuarioCreador.equals(usuario);
    if (_equals) {
      _or = true;
    } else {
      boolean _equals_1 = Objects.equal(this.tipo, TipoReceta.PUBLICA);
      _or = _equals_1;
    }
    return _or;
  }
  
  private int cantidadDeAzucarEnLosCondimentos() {
    Set<Condimento> _keySet = this.condimentos.keySet();
    final Function2<Integer, Condimento, Integer> _function = new Function2<Integer, Condimento, Integer>() {
      public Integer apply(final Integer acum, final Condimento condimento) {
        Integer _get = Receta.this.condimentos.get(condimento);
        int _cantidadDeAzucar = condimento.cantidadDeAzucar((_get).intValue());
        return Integer.valueOf(((acum).intValue() + _cantidadDeAzucar));
      }
    };
    return (int) IterableExtensions.<Condimento, Integer>fold(_keySet, Integer.valueOf(0), _function);
  }
  
  public void agregarSubReceta(final IReceta receta) {
    this.subRecetas.add(receta);
  }
  
  public boolean puedeVer(final Usuario usuario) {
    boolean _or = false;
    boolean _or_1 = false;
    boolean _or_2 = false;
    boolean _equals = Objects.equal(this.usuarioCreador, null);
    if (_equals) {
      _or_2 = true;
    } else {
      String _nombre = this.usuarioCreador.getNombre();
      String _nombre_1 = usuario.getNombre();
      boolean _equals_1 = _nombre.equals(_nombre_1);
      _or_2 = _equals_1;
    }
    if (_or_2) {
      _or_1 = true;
    } else {
      boolean _equals_2 = Objects.equal(this.tipo, TipoReceta.PUBLICA);
      _or_1 = _equals_2;
    }
    if (_or_1) {
      _or = true;
    } else {
      boolean _comparteGrupo = this.usuarioCreador.comparteGrupo(usuario);
      _or = _comparteGrupo;
    }
    return _or;
  }
  
  public boolean esIgual(final Receta receta) {
    return Objects.equal(this.nombre, receta.nombre);
  }
  
  public boolean estaContenido(final List<Receta> recetas) {
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta receta) {
        return Boolean.valueOf(Receta.this.esIgual(receta));
      }
    };
    return IterableExtensions.<Receta>exists(recetas, _function);
  }
  
  public void setPublica() {
    this.tipo = TipoReceta.PUBLICA;
  }
  
  public Receta clone() {
    Receta _xblockexpression = null;
    {
      final Receta nueva = new Receta();
      nueva.nombre = this.nombre;
      nueva.ingredientes = this.ingredientes;
      nueva.condimentos = this.condimentos;
      nueva.anio = this.anio;
      nueva.usuarioCreador = this.usuarioCreador;
      nueva.explicacion = this.explicacion;
      nueva.dificultad = this.dificultad;
      nueva.temporadas = this.temporadas;
      nueva.subRecetas = this.subRecetas;
      _xblockexpression = nueva;
    }
    return _xblockexpression;
  }
  
  @Pure
  public Usuario getUsuarioCreador() {
    return this.usuarioCreador;
  }
  
  public void setUsuarioCreador(final Usuario usuarioCreador) {
    this.usuarioCreador = usuarioCreador;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public int getAnio() {
    return this.anio;
  }
  
  public void setAnio(final int anio) {
    this.anio = anio;
  }
  
  @Pure
  public int getTiempoPreparacion() {
    return this.tiempoPreparacion;
  }
  
  public void setTiempoPreparacion(final int tiempoPreparacion) {
    this.tiempoPreparacion = tiempoPreparacion;
  }
  
  @Pure
  public Dificultad getDificultad() {
    return this.dificultad;
  }
  
  public void setDificultad(final Dificultad dificultad) {
    this.dificultad = dificultad;
  }
  
  @Pure
  public List<Temporada> getTemporadas() {
    return this.temporadas;
  }
  
  public void setTemporadas(final List<Temporada> temporadas) {
    this.temporadas = temporadas;
  }
  
  @Pure
  public TipoReceta getTipo() {
    return this.tipo;
  }
  
  public void setTipo(final TipoReceta tipo) {
    this.tipo = tipo;
  }
  
  public void setIngredientes(final Map<Ingrediente, Integer> ingredientes) {
    this.ingredientes = ingredientes;
  }
  
  public void setCondimentos(final Map<Condimento, Integer> condimentos) {
    this.condimentos = condimentos;
  }
  
  public void setCalorias(final int calorias) {
    this.calorias = calorias;
  }
  
  public void setExplicacion(final String explicacion) {
    this.explicacion = explicacion;
  }
}
