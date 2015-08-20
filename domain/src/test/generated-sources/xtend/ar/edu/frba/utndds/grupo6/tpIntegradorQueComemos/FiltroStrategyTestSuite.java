package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FiltroPostaS;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.junit.Assert;
import org.junit.Test;
import queComemos.entrega3.dominio.Dificultad;

@SuppressWarnings("all")
public class FiltroStrategyTestSuite {
  private DateFormat format = new SimpleDateFormat("dd-mm-yyyy");
  
  private Date fecha = new Function0<Date>() {
    public Date apply() {
      try {
        Date _parse = FiltroStrategyTestSuite.this.format.parse("01-04-1970");
        return _parse;
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    }
  }.apply();
  
  private Usuario usuario1 = this.getUsuario();
  
  @Test
  public void FiltroStrategTodosLosFiltros() {
    final FiltroPostaS FiltroCompleto = new FiltroPostaS();
    FiltroCompleto.agregarFiltroNoLeGusta();
    FiltroCompleto.agregarFiltroExcesoCalorias();
    FiltroCompleto.agregarFiltroCaros();
    FiltroCompleto.agregarFiltroCondicionesPreexistentes();
    List<Receta> _recetas = this.usuario1.getRecetas();
    final List<Receta> listaFiltrada = FiltroCompleto.aplicarFiltro(_recetas, this.usuario1);
    int _size = listaFiltrada.size();
    boolean _equals = (_size == 0);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void FiltroStrategyCarosCaloriasYNoLeGusta() {
    final FiltroPostaS FiltroCarosCaloriasYNoLeGusta = new FiltroPostaS();
    FiltroCarosCaloriasYNoLeGusta.agregarFiltroNoLeGusta();
    FiltroCarosCaloriasYNoLeGusta.agregarFiltroCaros();
    FiltroCarosCaloriasYNoLeGusta.agregarFiltroExcesoCalorias();
    List<Receta> _recetas = this.usuario1.getRecetas();
    final List<Receta> listaFiltrada = FiltroCarosCaloriasYNoLeGusta.aplicarFiltro(_recetas, this.usuario1);
    int _size = listaFiltrada.size();
    boolean _equals = (_size == 1);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void FiltroStrategyCarosYNoLeGusta() {
    final FiltroPostaS FiltroCarosYNoLeGusta = new FiltroPostaS();
    FiltroCarosYNoLeGusta.agregarFiltroNoLeGusta();
    FiltroCarosYNoLeGusta.agregarFiltroCaros();
    List<Receta> _recetas = this.usuario1.getRecetas();
    final List<Receta> listaFiltrada = FiltroCarosYNoLeGusta.aplicarFiltro(_recetas, this.usuario1);
    int _size = listaFiltrada.size();
    boolean _equals = (_size == 2);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void FiltroStrategyNoLeGusta() {
    final FiltroPostaS FiltroNoLeGusta = new FiltroPostaS();
    FiltroNoLeGusta.agregarFiltroNoLeGusta();
    List<Receta> _recetas = this.usuario1.getRecetas();
    final List<Receta> listaFiltrada = FiltroNoLeGusta.aplicarFiltro(_recetas, this.usuario1);
    int _size = listaFiltrada.size();
    boolean _equals = (_size == 3);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void FiltroStrategySinFiltro() {
    final FiltroPostaS SinFiltro = new FiltroPostaS();
    List<Receta> _recetas = this.usuario1.getRecetas();
    final List<Receta> listaFiltrada = SinFiltro.aplicarFiltro(_recetas, this.usuario1);
    int _size = listaFiltrada.size();
    boolean _equals = (_size == 4);
    Assert.assertTrue(_equals);
  }
  
  public UsuarioPosta getUsuario() {
    final UsuarioPosta pepe = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    final ArrayList<String> platosQueNoLeGustan = new ArrayList<String>();
    platosQueNoLeGustan.add("Pure");
    pepe.setPlatosQueNoLeGustan(platosQueNoLeGustan);
    Receta _recetaNoLeGusta = this.getRecetaNoLeGusta();
    pepe.agregarReceta(_recetaNoLeGusta);
    Receta _recetaCara = this.getRecetaCara();
    pepe.agregarReceta(_recetaCara);
    Receta _recetaCalorias = this.getRecetaCalorias();
    pepe.agregarReceta(_recetaCalorias);
    Receta _recetaInadecuada = this.getRecetaInadecuada();
    pepe.agregarReceta(_recetaInadecuada);
    return pepe;
  }
  
  public Receta getRecetaNoLeGusta() {
    Receta _xblockexpression = null;
    {
      final String nombre = "Pure";
      final HashMap<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>();
      ingredientes.put(Ingrediente.PAPA, Integer.valueOf(200));
      final HashMap<Condimento, Integer> condimentos = new HashMap<Condimento, Integer>();
      condimentos.put(Condimento.SAL, Integer.valueOf(10));
      condimentos.put(Condimento.ACEITE, Integer.valueOf(10));
      condimentos.put(Condimento.AZUCAR, Integer.valueOf(100));
      final String explicacion = ((("1 - Pelar las papas\n" + 
        "2 - Hervir las papas 20 minutos") + 
        "3 - Pisar las papas con un pisapapas") + 
        "4 - Condimentar");
      final ArrayList<Temporada> temporadas = new ArrayList<Temporada>();
      temporadas.add(Temporada.INVIERNO);
      temporadas.add(Temporada.OTONIO);
      temporadas.add(Temporada.PRIMAVERA);
      temporadas.add(Temporada.VERANO);
      final Receta recetaSimple = new Receta(this.usuario1, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas);
      recetaSimple.setCalorias(100);
      _xblockexpression = recetaSimple;
    }
    return _xblockexpression;
  }
  
  public Receta getRecetaCara() {
    Receta _xblockexpression = null;
    {
      final String nombre = "Lechon";
      final HashMap<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>();
      ingredientes.put(Ingrediente.PAPA, Integer.valueOf(200));
      ingredientes.put(Ingrediente.LECHON, Integer.valueOf(100));
      final HashMap<Condimento, Integer> condimentos = new HashMap<Condimento, Integer>();
      condimentos.put(Condimento.SAL, Integer.valueOf(10));
      condimentos.put(Condimento.ACEITE, Integer.valueOf(10));
      final String explicacion = ((("1 - Pelar las papas\n" + 
        "2 - Hervir las papas 20 minutos") + 
        "3 - Pisar las papas con un pisapapas") + 
        "4 - Condimentar");
      final ArrayList<Temporada> temporadas = new ArrayList<Temporada>();
      temporadas.add(Temporada.INVIERNO);
      temporadas.add(Temporada.OTONIO);
      temporadas.add(Temporada.PRIMAVERA);
      temporadas.add(Temporada.VERANO);
      final Receta recetaSimple = new Receta(this.usuario1, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas);
      recetaSimple.setCalorias(150);
      _xblockexpression = recetaSimple;
    }
    return _xblockexpression;
  }
  
  public Receta getRecetaCalorias() {
    Receta _xblockexpression = null;
    {
      final String nombre = "Torta";
      final HashMap<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>();
      ingredientes.put(Ingrediente.PAPA, Integer.valueOf(200));
      final HashMap<Condimento, Integer> condimentos = new HashMap<Condimento, Integer>();
      condimentos.put(Condimento.SAL, Integer.valueOf(10));
      condimentos.put(Condimento.ACEITE, Integer.valueOf(10));
      condimentos.put(Condimento.AZUCAR, Integer.valueOf(350));
      final String explicacion = ((("1 - Pelar las papas\n" + 
        "2 - Hervir las papas 20 minutos") + 
        "3 - Pisar las papas con un pisapapas") + 
        "4 - Condimentar");
      final ArrayList<Temporada> temporadas = new ArrayList<Temporada>();
      temporadas.add(Temporada.INVIERNO);
      temporadas.add(Temporada.OTONIO);
      temporadas.add(Temporada.PRIMAVERA);
      temporadas.add(Temporada.VERANO);
      final Receta recetaSimple = new Receta(this.usuario1, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas);
      recetaSimple.setCalorias(600);
      _xblockexpression = recetaSimple;
    }
    return _xblockexpression;
  }
  
  public Receta getRecetaInadecuada() {
    Receta _xblockexpression = null;
    {
      final String nombre = "ZZZZZ";
      final HashMap<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>();
      ingredientes.put(Ingrediente.PAPA, Integer.valueOf(1000));
      final HashMap<Condimento, Integer> condimentos = new HashMap<Condimento, Integer>();
      condimentos.put(Condimento.SAL, Integer.valueOf(10));
      condimentos.put(Condimento.ACEITE, Integer.valueOf(10));
      condimentos.put(Condimento.AZUCAR, Integer.valueOf(100));
      final String explicacion = ((("1 - Pelar las papas\n" + 
        "2 - Hervir las papas 20 minutos") + 
        "3 - Pisar las papas con un pisapapas") + 
        "4 - Condimentar");
      final ArrayList<Temporada> temporadas = new ArrayList<Temporada>();
      temporadas.add(Temporada.INVIERNO);
      temporadas.add(Temporada.OTONIO);
      temporadas.add(Temporada.PRIMAVERA);
      temporadas.add(Temporada.VERANO);
      final Receta recetaSimple = new Receta(this.usuario1, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas);
      recetaSimple.setCalorias(300);
      _xblockexpression = recetaSimple;
    }
    return _xblockexpression;
  }
}
