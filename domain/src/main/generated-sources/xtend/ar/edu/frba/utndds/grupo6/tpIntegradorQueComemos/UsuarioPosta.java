package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Consumidor;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Grupo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Observador;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Recetario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.SujetoObservado;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import queComemos.entrega3.dominio.Dificultad;

@SuppressWarnings("all")
public class UsuarioPosta extends SujetoObservado implements Usuario, Consumidor {
  private double altura;
  
  private double peso;
  
  private Sexo sexo;
  
  private Rutina rutina;
  
  private String nombre;
  
  private Date fechaNacimiento;
  
  private String email;
  
  private List<Ingrediente> preferenciasAlimenticias = new ArrayList<Ingrediente>();
  
  private List<String> platosQueNoLeGustan = new ArrayList<String>();
  
  private List<Receta> recetasBuscadasFavoritas = new ArrayList<Receta>();
  
  @Accessors
  private List<Ingrediente> ingredientesFeos = new ArrayList<Ingrediente>();
  
  private List<Receta> recetas = new ArrayList<Receta>();
  
  private List<Receta> consultas = new ArrayList<Receta>();
  
  private List<Grupo> grupos = new ArrayList<Grupo>();
  
  private List<Receta> favoritas = new ArrayList<Receta>();
  
  private Recetario recetario;
  
  public UsuarioPosta(final double peso, final double altura, final Rutina rutina, final String nombre, final Sexo sexo, final Date fechaNacimiento) {
    this.altura = altura;
    this.peso = peso;
    this.rutina = rutina;
    this.fechaNacimiento = fechaNacimiento;
    this.nombre = nombre;
    this.sexo = sexo;
    Recetario _instance = Recetario.getInstance();
    this.recetario = _instance;
  }
  
  public void setNombre(final String unNombre) {
    this.nombre = unNombre;
  }
  
  public void setFechaNacimiento(final Date unaFecha) {
    this.fechaNacimiento = unaFecha;
  }
  
  public void setPeso(final double peso) {
    this.peso = peso;
  }
  
  public void setAltura(final double altura) {
    this.altura = altura;
  }
  
  public void setSexo(final Sexo sexo) {
    this.sexo = sexo;
  }
  
  public void setPreferenciasAlimenticias(final Map<Ingrediente, Integer> alimentos) {
    this.setPreferenciasAlimenticias(alimentos);
  }
  
  public void setPlatosQueNoLeGustan(final ArrayList<String> listaDeAlimentos) {
    this.platosQueNoLeGustan = listaDeAlimentos;
  }
  
  public void setRutina(final Rutina rutina) {
    this.rutina = rutina;
  }
  
  public Receta getReceta(final String nombre) {
    return this.recetario.getReceta(nombre);
  }
  
  public Sexo getSexo() {
    return this.sexo;
  }
  
  public String getEmail() {
    return this.email;
  }
  
  public String getNombre() {
    return this.nombre;
  }
  
  public List<Receta> getRecetas() {
    return this.recetas;
  }
  
  public List<String> getPlatosQueNoLeGustan() {
    return this.platosQueNoLeGustan;
  }
  
  public List<Receta> getRecetasConAcceso() {
    final Recetario recetario = Recetario.getInstance();
    final List<Receta> recetas = recetario.listarTodas();
    this.consultas.clear();
    final Consumer<Receta> _function = new Consumer<Receta>() {
      public void accept(final Receta receta) {
        boolean _puedeVer = receta.puedeVer(UsuarioPosta.this);
        if (_puedeVer) {
          UsuarioPosta.this.consultas.add(receta);
        }
      }
    };
    recetas.forEach(_function);
    this.notificar();
    return this.consultas;
  }
  
  public double getPeso() {
    return this.peso;
  }
  
  public double getAltura() {
    return this.altura;
  }
  
  public Rutina getRutina() {
    return this.rutina;
  }
  
  public List<Ingrediente> getPreferenciasAlimenticias() {
    return this.preferenciasAlimenticias;
  }
  
  public double getIMC() {
    return (this.peso / (this.altura * this.altura));
  }
  
  public List<Receta> getConsultas() {
    return this.consultas;
  }
  
  public List<Receta> getRecetasBuscadasFavoritas() {
    return this.recetasBuscadasFavoritas;
  }
  
  public Boolean modificarReceta(final String nombreRecetaAModificar, final String nombreReceta, final Map<Ingrediente, Integer> ingredientes, final Map<Condimento, Integer> condimentos, final String explicacion, final Dificultad dificultad, final List<Temporada> temporada) {
    boolean _xblockexpression = false;
    {
      final Receta receta = this.getReceta(nombreRecetaAModificar);
      boolean _xifexpression = false;
      boolean _puedeModificar = receta.puedeModificar(this);
      if (_puedeModificar) {
        boolean _xifexpression_1 = false;
        Usuario _usuarioCreador = receta.getUsuarioCreador();
        boolean _equals = _usuarioCreador.equals(this);
        if (_equals) {
          receta.setNombre(nombreReceta);
          receta.setIngredientes(ingredientes);
          receta.setCondimentos(condimentos);
          receta.setExplicacion(explicacion);
          receta.setDificultad(dificultad);
          receta.setTemporadas(temporada);
        } else {
          boolean _xblockexpression_1 = false;
          {
            final Receta receta1 = receta.clone();
            receta1.setNombre(nombreReceta);
            receta1.setIngredientes(ingredientes);
            receta1.setCondimentos(condimentos);
            receta1.setExplicacion(explicacion);
            receta1.setDificultad(dificultad);
            receta1.setTemporadas(temporada);
            receta1.setUsuarioCreador(this);
            _xblockexpression_1 = this.recetas.add(receta1);
          }
          _xifexpression_1 = _xblockexpression_1;
        }
        _xifexpression = _xifexpression_1;
      }
      _xblockexpression = _xifexpression;
    }
    return Boolean.valueOf(_xblockexpression);
  }
  
  public boolean agregarReceta(final Receta receta) {
    boolean _xblockexpression = false;
    {
      this.recetas.add(receta);
      Recetario _instance = Recetario.getInstance();
      _xblockexpression = _instance.agregar(receta);
    }
    return _xblockexpression;
  }
  
  public boolean comparteGrupo(final Usuario usuario) {
    final Function1<Grupo, Boolean> _function = new Function1<Grupo, Boolean>() {
      public Boolean apply(final Grupo x) {
        return Boolean.valueOf(x.contieneAlUsuario(usuario));
      }
    };
    return IterableExtensions.<Grupo>exists(this.grupos, _function);
  }
  
  public boolean puedeComer(final Receta receta) {
    return true;
  }
  
  public boolean tieneIngredientesFeos(final Map<Ingrediente, Integer> ingredientes) {
    final Function1<Ingrediente, Boolean> _function = new Function1<Ingrediente, Boolean>() {
      public Boolean apply(final Ingrediente ingredienteFeo) {
        Set<Ingrediente> _keySet = ingredientes.keySet();
        return Boolean.valueOf(_keySet.contains(ingredienteFeo));
      }
    };
    return IterableExtensions.<Ingrediente>exists(this.ingredientesFeos, _function);
  }
  
  public boolean sePuedeSugerir(final Receta receta) {
    Map<Ingrediente, Integer> _ingredientes = receta.getIngredientes();
    boolean _tieneIngredientesFeos = this.tieneIngredientesFeos(_ingredientes);
    return (!_tieneIngredientesFeos);
  }
  
  public boolean marcarComoFavorita(final Receta receta) {
    boolean _xifexpression = false;
    boolean _puedeVer = receta.puedeVer(this);
    if (_puedeVer) {
      _xifexpression = this.favoritas.add(receta);
    }
    return _xifexpression;
  }
  
  public void agregarGrupo(final Grupo grupo) {
    this.grupos.add(grupo);
  }
  
  public boolean cumpleCamposObligatorios() {
    boolean _and = false;
    boolean _and_1 = false;
    boolean _and_2 = false;
    boolean _and_3 = false;
    boolean _notEquals = (!Objects.equal(this.nombre, null));
    if (!_notEquals) {
      _and_3 = false;
    } else {
      _and_3 = (this.peso > 0);
    }
    if (!_and_3) {
      _and_2 = false;
    } else {
      _and_2 = (this.altura > 0);
    }
    if (!_and_2) {
      _and_1 = false;
    } else {
      boolean _notEquals_1 = (!Objects.equal(this.fechaNacimiento, null));
      _and_1 = _notEquals_1;
    }
    if (!_and_1) {
      _and = false;
    } else {
      boolean _notEquals_2 = (!Objects.equal(this.rutina, null));
      _and = _notEquals_2;
    }
    return _and;
  }
  
  public boolean fechaNacimientoValida() {
    Date _date = new Date();
    return this.fechaNacimiento.before(_date);
  }
  
  public boolean nombreCorrecto() {
    int _length = this.nombre.length();
    return (_length > 4);
  }
  
  public boolean estadoRutina() {
    boolean _and = false;
    double _iMC = this.getIMC();
    boolean _greaterThan = (_iMC > 18);
    if (!_greaterThan) {
      _and = false;
    } else {
      double _iMC_1 = this.getIMC();
      boolean _lessThan = (_iMC_1 < 30);
      _and = _lessThan;
    }
    return _and;
  }
  
  public boolean usuarioValido() {
    boolean _and = false;
    boolean _cumpleCamposObligatorios = this.cumpleCamposObligatorios();
    if (!_cumpleCamposObligatorios) {
      _and = false;
    } else {
      boolean _nombreCorrecto = this.nombreCorrecto();
      _and = _nombreCorrecto;
    }
    return _and;
  }
  
  public Boolean cumpleMismasCondiciones(final Usuario usuario) {
    return Boolean.valueOf(true);
  }
  
  public Usuario crearPerfil() {
    final UsuarioPosta usuarioCopia = new UsuarioPosta(this.peso, this.altura, this.rutina, this.nombre, this.sexo, this.fechaNacimiento);
    return usuarioCopia;
  }
  
  public void notificar() {
    ArrayList<Observador> _observadores = this.getObservadores();
    final Consumer<Observador> _function = new Consumer<Observador>() {
      public void accept(final Observador it) {
        it.actualizar(UsuarioPosta.this);
      }
    };
    _observadores.forEach(_function);
  }
  
  public boolean esVegano() {
    return false;
  }
  
  public boolean esHipertenso() {
    return false;
  }
  
  public boolean esDiabetico() {
    return false;
  }
  
  @Pure
  public List<Ingrediente> getIngredientesFeos() {
    return this.ingredientesFeos;
  }
  
  public void setIngredientesFeos(final List<Ingrediente> ingredientesFeos) {
    this.ingredientesFeos = ingredientesFeos;
  }
}
