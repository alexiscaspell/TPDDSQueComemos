package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Command;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.RecetaAdapter;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ResultadoConsulta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import com.google.common.base.Objects;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;
import queComemos.entrega3.dominio.Dificultad;
import queComemos.entrega3.repositorio.BusquedaRecetas;
import queComemos.entrega3.repositorio.RepoRecetas;

@SuppressWarnings("all")
public class Recetario {
  @Accessors
  private Command sendMailCommand;
  
  private RepoRecetas repoRecetas = new RepoRecetas();
  
  private Gson gson = new Gson();
  
  private RecetaAdapter adapter = new RecetaAdapter();
  
  private ArrayList<Receta> recetas;
  
  private static Recetario instance;
  
  public static Recetario getInstance() {
    Recetario _xifexpression = null;
    boolean _equals = Objects.equal(Recetario.instance, null);
    if (_equals) {
      Recetario _recetario = new Recetario();
      _xifexpression = Recetario.instance = _recetario;
    } else {
      _xifexpression = Recetario.instance;
    }
    return _xifexpression;
  }
  
  private Recetario() {
    ArrayList<Receta> _arrayList = new ArrayList<Receta>();
    this.recetas = _arrayList;
  }
  
  public boolean agregar(final Receta receta) {
    return this.recetas.add(receta);
  }
  
  public boolean quitar(final Receta receta) {
    return this.recetas.remove(receta);
  }
  
  public List<Receta> listarTodas() {
    ArrayList<Receta> _xblockexpression = null;
    {
      List<Receta> _recetasExternas = this.getRecetasExternas();
      this.recetas.addAll(_recetasExternas);
      _xblockexpression = this.recetas;
    }
    return _xblockexpression;
  }
  
  public Receta getReceta(final String nombre) {
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta x) {
        String _nombre = x.getNombre();
        return Boolean.valueOf(Objects.equal(_nombre, nombre));
      }
    };
    return IterableExtensions.<Receta>findFirst(this.recetas, _function);
  }
  
  public void reset() {
    this.recetas.clear();
  }
  
  public List<Receta> getRecetasExternas() {
    ArrayList<Receta> _xblockexpression = null;
    {
      BusquedaRecetas _busquedaRecetas = new BusquedaRecetas();
      final String recetasJson = this.repoRecetas.getRecetas(_busquedaRecetas);
      final ArrayList<queComemos.entrega3.dominio.Receta> listRecetasExternas = new ArrayList<queComemos.entrega3.dominio.Receta>();
      JsonParser _jsonParser = new JsonParser();
      JsonElement _parse = _jsonParser.parse(recetasJson);
      final Consumer<JsonElement> _function = new Consumer<JsonElement>() {
        public void accept(final JsonElement x) {
          final queComemos.entrega3.dominio.Receta recetaGson = Recetario.this.gson.<queComemos.entrega3.dominio.Receta>fromJson(x, queComemos.entrega3.dominio.Receta.class);
          listRecetasExternas.add(recetaGson);
        }
      };
      ((JsonArray) _parse).forEach(_function);
      final ArrayList<Receta> recetasAdaptadas = new ArrayList<Receta>();
      final Consumer<queComemos.entrega3.dominio.Receta> _function_1 = new Consumer<queComemos.entrega3.dominio.Receta>() {
        public void accept(final queComemos.entrega3.dominio.Receta x) {
          Receta _receta = Recetario.this.adapter.getReceta(x);
          recetasAdaptadas.add(_receta);
        }
      };
      listRecetasExternas.forEach(_function_1);
      final Function1<Receta, Boolean> _function_2 = new Function1<Receta, Boolean>() {
        public Boolean apply(final Receta x) {
          boolean _contains = Recetario.this.recetas.contains(x);
          return Boolean.valueOf((!_contains));
        }
      };
      Iterable<Receta> _filter = IterableExtensions.<Receta>filter(recetasAdaptadas, _function_2);
      List<Receta> _list = IterableExtensions.<Receta>toList(_filter);
      _xblockexpression = ((ArrayList<Receta>) _list);
    }
    return _xblockexpression;
  }
  
  public ResultadoConsulta getRecetasQueCumplen(final Usuario usuario, final Receta receta) {
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta x) {
        boolean _or = false;
        boolean _or_1 = false;
        boolean _or_2 = false;
        boolean _or_3 = false;
        boolean _and = false;
        boolean _puedeVer = x.puedeVer(usuario);
        if (!_puedeVer) {
          _and = false;
        } else {
          String _nombre = receta.getNombre();
          boolean _equals = Objects.equal(_nombre, null);
          _and = _equals;
        }
        if (_and) {
          _or_3 = true;
        } else {
          boolean _and_1 = false;
          String _nombre_1 = receta.getNombre();
          String _nombre_2 = x.getNombre();
          boolean _equals_1 = _nombre_1.equals(_nombre_2);
          if (!_equals_1) {
            _and_1 = false;
          } else {
            int _anio = receta.getAnio();
            boolean _equals_2 = (_anio == 0);
            _and_1 = _equals_2;
          }
          _or_3 = _and_1;
        }
        if (_or_3) {
          _or_2 = true;
        } else {
          boolean _and_2 = false;
          int _anio_1 = receta.getAnio();
          int _anio_2 = x.getAnio();
          boolean _equals_3 = (_anio_1 == _anio_2);
          if (!_equals_3) {
            _and_2 = false;
          } else {
            Dificultad _dificultad = receta.getDificultad();
            boolean _equals_4 = Objects.equal(_dificultad, null);
            _and_2 = _equals_4;
          }
          _or_2 = _and_2;
        }
        if (_or_2) {
          _or_1 = true;
        } else {
          boolean _and_3 = false;
          Dificultad _dificultad_1 = receta.getDificultad();
          Dificultad _dificultad_2 = x.getDificultad();
          boolean _equals_5 = Objects.equal(_dificultad_1, _dificultad_2);
          if (!_equals_5) {
            _and_3 = false;
          } else {
            String _explicacion = receta.getExplicacion();
            boolean _equals_6 = Objects.equal(_explicacion, null);
            _and_3 = _equals_6;
          }
          _or_1 = _and_3;
        }
        if (_or_1) {
          _or = true;
        } else {
          String _explicacion_1 = receta.getExplicacion();
          String _explicacion_2 = x.getExplicacion();
          boolean _equals_7 = _explicacion_1.equals(_explicacion_2);
          _or = _equals_7;
        }
        return Boolean.valueOf(_or);
      }
    };
    Iterable<Receta> _filter = IterableExtensions.<Receta>filter(this.recetas, _function);
    final List<Receta> recetasQueCoinciden = IterableExtensions.<Receta>toList(_filter);
    final ResultadoConsulta resultado = new ResultadoConsulta(receta, recetasQueCoinciden, usuario);
    this.sendMailCommand.execute(resultado);
    int _size = recetasQueCoinciden.size();
    boolean _greaterThan = (_size > 100);
    if (_greaterThan) {
    }
    return resultado;
  }
  
  @Pure
  public Command getSendMailCommand() {
    return this.sendMailCommand;
  }
  
  public void setSendMailCommand(final Command sendMailCommand) {
    this.sendMailCommand = sendMailCommand;
  }
}
