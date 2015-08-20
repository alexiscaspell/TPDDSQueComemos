package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Grupo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioHipertenso;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioVegano;
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
public class GrupoTestSuite {
  /**
   * ----------------VARIABLES------------------
   */
  private DateFormat format = new SimpleDateFormat("dd-mm-yyyy");
  
  private Date fecha = new Function0<Date>() {
    public Date apply() {
      try {
        Date _parse = GrupoTestSuite.this.format.parse("01-04-1970");
        return _parse;
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    }
  }.apply();
  
  /**
   * -----------------USUARIOS-----------------
   */
  private Usuario hipertenso;
  
  private Usuario vegano;
  
  private final UsuarioPosta pepe = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
  
  private final UsuarioPosta carlos = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
  
  private final UsuarioPosta raul = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
  
  /**
   * ---------------RECETAS---------------
   */
  public Receta pureConAzucarYSinSal() {
    Receta _xblockexpression = null;
    {
      final UsuarioPosta usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE, "Juan Carlos Lopez", Sexo.MASCULINO, this.fecha);
      final String nombre = "Pure";
      final HashMap<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>();
      ingredientes.put(Ingrediente.PAPA, Integer.valueOf(1000));
      final HashMap<Condimento, Integer> condimentos = new HashMap<Condimento, Integer>();
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
      final Receta recetaSimple = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas);
      _xblockexpression = recetaSimple;
    }
    return _xblockexpression;
  }
  
  public Receta getRecetaMilanesas() {
    Receta _xblockexpression = null;
    {
      final UsuarioPosta usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE, "Juan Carlos Lopez", Sexo.MASCULINO, this.fecha);
      final String nombre = "Milanesas";
      final HashMap<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>();
      ingredientes.put(Ingrediente.CARNE, Integer.valueOf(1000));
      ingredientes.put(Ingrediente.HUEVO, Integer.valueOf(6));
      ingredientes.put(Ingrediente.PAN_RAYADO, Integer.valueOf(6));
      final HashMap<Condimento, Integer> condimentos = new HashMap<Condimento, Integer>();
      condimentos.put(Condimento.ACEITE, Integer.valueOf(10));
      final String explicacion = ((("1 - Cortar la carne\n" + 
        "2 - Pasar la carne por el huevo") + 
        "3 - Pasar la carne por pan rayado") + 
        "4 - Hornear 25 minutos");
      final ArrayList<Temporada> temporadas = new ArrayList<Temporada>();
      temporadas.add(Temporada.INVIERNO);
      temporadas.add(Temporada.OTONIO);
      temporadas.add(Temporada.PRIMAVERA);
      temporadas.add(Temporada.VERANO);
      final Receta recetaSimple = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas);
      _xblockexpression = recetaSimple;
    }
    return _xblockexpression;
  }
  
  /**
   * ---------------GRUPOS---------------
   */
  public Grupo getGrupoDePrueba() {
    Grupo _xblockexpression = null;
    {
      final List<Usuario> listaUsuariosDelGrupo = new ArrayList<Usuario>();
      UsuarioVegano _usuarioVegano = new UsuarioVegano(this.pepe);
      listaUsuariosDelGrupo.add(this.vegano = _usuarioVegano);
      UsuarioHipertenso _usuarioHipertenso = new UsuarioHipertenso(this.raul);
      listaUsuariosDelGrupo.add(this.hipertenso = _usuarioHipertenso);
      listaUsuariosDelGrupo.add(this.carlos);
      final List<Receta> listaRecetasPreferidas = new ArrayList<Receta>();
      Receta _pureConAzucarYSinSal = this.pureConAzucarYSinSal();
      listaRecetasPreferidas.add(_pureConAzucarYSinSal);
      final Grupo grupoDePruebas = new Grupo();
      grupoDePruebas.setIntegrantes(listaUsuariosDelGrupo);
      grupoDePruebas.setRecetasPreferidas(listaRecetasPreferidas);
      _xblockexpression = grupoDePruebas;
    }
    return _xblockexpression;
  }
  
  public Grupo getGrupoDePrueba2() {
    Grupo _xblockexpression = null;
    {
      final List<Usuario> listaUsuariosDelGrupo = new ArrayList<Usuario>();
      UsuarioHipertenso _usuarioHipertenso = new UsuarioHipertenso(this.raul);
      listaUsuariosDelGrupo.add(this.hipertenso = _usuarioHipertenso);
      listaUsuariosDelGrupo.add(this.carlos);
      final List<Receta> listaRecetasPreferidas = new ArrayList<Receta>();
      Receta _pureConAzucarYSinSal = this.pureConAzucarYSinSal();
      listaRecetasPreferidas.add(_pureConAzucarYSinSal);
      final Grupo grupoDePruebas = new Grupo();
      grupoDePruebas.setIntegrantes(listaUsuariosDelGrupo);
      grupoDePruebas.setRecetasPreferidas(listaRecetasPreferidas);
      _xblockexpression = grupoDePruebas;
    }
    return _xblockexpression;
  }
  
  @Test
  public void grupoDePruebaPuedeComerPureConAzucarYSinSal() {
    final Grupo grupoDePruebas = this.getGrupoDePrueba();
    final Receta pure = this.pureConAzucarYSinSal();
    boolean _puedeComer = grupoDePruebas.puedeComer(pure);
    Assert.assertTrue(_puedeComer);
  }
  
  @Test
  public void sePuedeSugerirAGrupoDePruebaPureConAzucarYSinSal() {
    final Grupo grupoDePruebas = this.getGrupoDePrueba();
    final Receta pure = this.pureConAzucarYSinSal();
    boolean _puedeComer = grupoDePruebas.puedeComer(pure);
    Assert.assertTrue(_puedeComer);
  }
  
  @Test
  public void noSePuedeSugerirAGrupoDePruebaMilangaXNoSerFavorita() {
    final Grupo grupoDePruebas = this.getGrupoDePrueba2();
    final Receta milanga = this.getRecetaMilanesas();
    boolean _sePuedeSugerir = grupoDePruebas.sePuedeSugerir(milanga);
    Assert.assertFalse(_sePuedeSugerir);
  }
  
  @Test
  public void noSePuedeSugerirAGrupoDePruebaMilangaXNoPoderSerComida() {
    final Grupo grupoDePruebas = this.getGrupoDePrueba();
    final Receta milanga = this.getRecetaMilanesas();
    boolean _sePuedeSugerir = grupoDePruebas.sePuedeSugerir(milanga);
    Assert.assertFalse(_sePuedeSugerir);
  }
  
  @Test
  public void esPreferidaEnGrupoDePruebaPureConAzucarYSinSal() {
    final Grupo grupoDePruebas = this.getGrupoDePrueba();
    final Receta pure = this.pureConAzucarYSinSal();
    boolean _esPreferida = grupoDePruebas.esPreferida(pure);
    Assert.assertTrue(_esPreferida);
  }
  
  @Test
  public void usuariosCompartenGrupo() {
    final UsuarioPosta pepe = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Pepe", Sexo.MASCULINO, this.fecha);
    final UsuarioPosta lui = new UsuarioPosta(70, 1.70, Rutina.MEDIANO, "Lui", Sexo.MASCULINO, this.fecha);
    final Grupo grupo = new Grupo();
    grupo.agregar(pepe);
    grupo.agregar(lui);
    boolean _comparteGrupo = pepe.comparteGrupo(lui);
    Assert.assertTrue(_comparteGrupo);
    boolean _comparteGrupo_1 = lui.comparteGrupo(pepe);
    Assert.assertTrue(_comparteGrupo_1);
  }
  
  @Test
  public void usuariosNoCompartenGrupo() {
    final UsuarioPosta pepe = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Pepe", Sexo.MASCULINO, this.fecha);
    final UsuarioPosta lui = new UsuarioPosta(70, 1.70, Rutina.MEDIANO, "Lui", Sexo.MASCULINO, this.fecha);
    final Grupo grupo = new Grupo();
    grupo.agregar(pepe);
    final Grupo grupo1 = new Grupo();
    grupo1.agregar(lui);
    boolean _comparteGrupo = pepe.comparteGrupo(lui);
    Assert.assertFalse(_comparteGrupo);
    boolean _comparteGrupo_1 = lui.comparteGrupo(pepe);
    Assert.assertFalse(_comparteGrupo_1);
  }
}
