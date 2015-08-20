package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Grupo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Recetario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.TipoReceta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioDiabetico;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioHipertenso;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioVegano;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import queComemos.entrega3.dominio.Dificultad;

@SuppressWarnings("all")
public class UsuarioTestSuite {
  private Usuario diabetico;
  
  private Usuario hipertenso;
  
  private Usuario vegano;
  
  private DateFormat format = new SimpleDateFormat("dd-mm-yyyy");
  
  private Date fecha = new Function0<Date>() {
    public Date apply() {
      try {
        Date _parse = UsuarioTestSuite.this.format.parse("01-04-1970");
        return _parse;
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    }
  }.apply();
  
  @Before
  public void SetUp() {
    Recetario _instance = Recetario.getInstance();
    _instance.reset();
  }
  
  @Test
  public void unTipoAlto() {
    final UsuarioPosta pepe = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    double _iMC = pepe.getIMC();
    Assert.assertEquals(22.27, _iMC, 0.01);
  }
  
  @Test
  public void testEnunciado() {
    final UsuarioPosta persona_enunciado = new UsuarioPosta(83, 1.88, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    double _iMC = persona_enunciado.getIMC();
    Assert.assertEquals(23.48, _iMC, 0.01);
  }
  
  @Test
  public void unTipoGordo() {
    final UsuarioPosta jesus = new UsuarioPosta(100, 1.75, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    double _iMC = jesus.getIMC();
    Assert.assertEquals(32.65, _iMC, 0.01);
  }
  
  @Test
  public void homeroSimpson() {
    final UsuarioPosta homero = new UsuarioPosta(113, 1.83, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    double _iMC = homero.getIMC();
    Assert.assertEquals(33.74, _iMC, 0.01);
  }
  
  @Test
  public void IMCDeUnUsuarioQueMide100YPesa150() {
    final UsuarioPosta usuario = new UsuarioPosta(100, 1.50, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    double _iMC = usuario.getIMC();
    Assert.assertEquals(44.44, _iMC, 0.01);
  }
  
  @Test
  public void usuarioDiabeticoSaludable() {
    final UsuarioPosta usuarioDiabeticoSaludable = new UsuarioPosta(82, 1.78, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    UsuarioDiabetico _usuarioDiabetico = new UsuarioDiabetico(usuarioDiabeticoSaludable);
    this.diabetico = _usuarioDiabetico;
    boolean _estadoRutina = this.diabetico.estadoRutina();
    Assert.assertTrue(_estadoRutina);
  }
  
  @Test
  public void usuarioDiabeticoNoSaludable() {
    final UsuarioPosta usuarioDiabeticoNoSaludable = new UsuarioPosta(82, 1.78, Rutina.LEVE, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    UsuarioDiabetico _usuarioDiabetico = new UsuarioDiabetico(usuarioDiabeticoNoSaludable);
    this.diabetico = _usuarioDiabetico;
    boolean _estadoRutina = this.diabetico.estadoRutina();
    Assert.assertFalse(_estadoRutina);
  }
  
  @Test
  public void usuarioDiabeticoGordo() {
    final UsuarioPosta usuarioDiabeticoGordo = new UsuarioPosta(100, 1.78, Rutina.INTENSIVO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    UsuarioDiabetico _usuarioDiabetico = new UsuarioDiabetico(usuarioDiabeticoGordo);
    this.diabetico = _usuarioDiabetico;
    boolean _estadoRutina = this.diabetico.estadoRutina();
    Assert.assertFalse(_estadoRutina);
  }
  
  @Test
  public void usuarioHipertensoSaludable() {
    final UsuarioPosta usuarioHipertensoSaludable = new UsuarioPosta(82, 1.78, Rutina.INTENSIVO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    UsuarioHipertenso _usuarioHipertenso = new UsuarioHipertenso(usuarioHipertensoSaludable);
    this.hipertenso = _usuarioHipertenso;
    boolean _estadoRutina = this.hipertenso.estadoRutina();
    Assert.assertTrue(_estadoRutina);
  }
  
  @Test
  public void usuarioHipertensoNoSaludable() {
    final UsuarioPosta usuarioHipertensoNoSaludable = new UsuarioPosta(82, 1.78, Rutina.LEVE, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    UsuarioHipertenso _usuarioHipertenso = new UsuarioHipertenso(usuarioHipertensoNoSaludable);
    this.hipertenso = _usuarioHipertenso;
    boolean _estadoRutina = this.hipertenso.estadoRutina();
    Assert.assertFalse(_estadoRutina);
  }
  
  @Test
  public void usuarioHipertensoGordo() {
    final UsuarioPosta usuarioHipertensoGordo = new UsuarioPosta(100, 1.78, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    UsuarioHipertenso _usuarioHipertenso = new UsuarioHipertenso(usuarioHipertensoGordo);
    this.hipertenso = _usuarioHipertenso;
    boolean _estadoRutina = this.hipertenso.estadoRutina();
    Assert.assertFalse(_estadoRutina);
  }
  
  @Test
  public void usuarioVeganoSaludable() {
    final UsuarioPosta usuarioVeganoNoSaludable = new UsuarioPosta(82, 1.88, Rutina.LEVE, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    UsuarioVegano _usuarioVegano = new UsuarioVegano(usuarioVeganoNoSaludable);
    this.vegano = _usuarioVegano;
    List<Ingrediente> _preferenciasAlimenticias = this.vegano.getPreferenciasAlimenticias();
    _preferenciasAlimenticias.add(Ingrediente.FRUTA);
    boolean _estadoRutina = this.vegano.estadoRutina();
    Assert.assertTrue(_estadoRutina);
  }
  
  @Test
  public void usuarioVeganoNoSaludable() {
    final UsuarioPosta usuarioVeganoNoSaludable = new UsuarioPosta(100, 1.78, Rutina.LEVE, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    UsuarioVegano _usuarioVegano = new UsuarioVegano(usuarioVeganoNoSaludable);
    this.vegano = _usuarioVegano;
    List<Ingrediente> _preferenciasAlimenticias = this.vegano.getPreferenciasAlimenticias();
    _preferenciasAlimenticias.add(Ingrediente.FRUTA);
    boolean _estadoRutina = this.vegano.estadoRutina();
    Assert.assertFalse(_estadoRutina);
  }
  
  @Test
  public void usuarioVeganoGordo() {
    final UsuarioPosta usuarioVeganoNoSaludable = new UsuarioPosta(100, 1.78, Rutina.LEVE, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    UsuarioVegano _usuarioVegano = new UsuarioVegano(usuarioVeganoNoSaludable);
    this.vegano = _usuarioVegano;
    List<Ingrediente> _preferenciasAlimenticias = this.vegano.getPreferenciasAlimenticias();
    _preferenciasAlimenticias.add(Ingrediente.FRUTA);
    boolean _estadoRutina = this.vegano.estadoRutina();
    Assert.assertFalse(_estadoRutina);
  }
  
  @Test
  public void usuarioVeganoValido() {
    final UsuarioPosta unUsuario = new UsuarioPosta(100, 1.78, Rutina.LEVE, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    List<Ingrediente> _preferenciasAlimenticias = unUsuario.getPreferenciasAlimenticias();
    _preferenciasAlimenticias.add(Ingrediente.PAPA);
    UsuarioVegano _usuarioVegano = new UsuarioVegano(unUsuario);
    this.vegano = _usuarioVegano;
    boolean _usuarioValido = this.vegano.usuarioValido();
    Assert.assertTrue(_usuarioValido);
  }
  
  @Test
  public void usuarioVeganoNoValido() {
    final UsuarioPosta usuarioVeganoNoValido = new UsuarioPosta(100, 1.78, Rutina.LEVE, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    List<Ingrediente> _preferenciasAlimenticias = usuarioVeganoNoValido.getPreferenciasAlimenticias();
    _preferenciasAlimenticias.add(Ingrediente.POLLO);
    UsuarioVegano _usuarioVegano = new UsuarioVegano(usuarioVeganoNoValido);
    this.vegano = _usuarioVegano;
    boolean _usuarioValido = this.vegano.usuarioValido();
    Assert.assertFalse(_usuarioValido);
  }
  
  @Test
  public void usuarioDiabeticoValido() {
    final UsuarioPosta unUsuario = new UsuarioPosta(100, 1.78, Rutina.LEVE, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    List<Ingrediente> _preferenciasAlimenticias = unUsuario.getPreferenciasAlimenticias();
    _preferenciasAlimenticias.add(Ingrediente.PAPA);
    UsuarioDiabetico _usuarioDiabetico = new UsuarioDiabetico(unUsuario);
    this.diabetico = _usuarioDiabetico;
    boolean _usuarioValido = this.diabetico.usuarioValido();
    Assert.assertTrue(_usuarioValido);
  }
  
  @Test
  public void usuarioDiabeticoNoValido() {
    final UsuarioPosta usuarioDiabeticoNoValido = new UsuarioPosta(100, 1.78, Rutina.LEVE, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    UsuarioDiabetico _usuarioDiabetico = new UsuarioDiabetico(usuarioDiabeticoNoValido);
    this.diabetico = _usuarioDiabetico;
    boolean _usuarioValido = this.diabetico.usuarioValido();
    Assert.assertFalse(_usuarioValido);
  }
  
  @Test
  public void usuarioHipertensoValido() {
    final UsuarioPosta unUsuario = new UsuarioPosta(100, 1.78, Rutina.LEVE, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    List<Ingrediente> _preferenciasAlimenticias = unUsuario.getPreferenciasAlimenticias();
    _preferenciasAlimenticias.add(Ingrediente.PAPA);
    UsuarioHipertenso _usuarioHipertenso = new UsuarioHipertenso(unUsuario);
    this.hipertenso = _usuarioHipertenso;
    boolean _usuarioValido = this.hipertenso.usuarioValido();
    Assert.assertTrue(_usuarioValido);
  }
  
  @Test
  public void usuarioHipertensoNoValido() {
    final UsuarioPosta usuarioHipertensoNoValido = new UsuarioPosta(100, 1.78, Rutina.LEVE, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    UsuarioHipertenso _usuarioHipertenso = new UsuarioHipertenso(usuarioHipertensoNoValido);
    this.hipertenso = _usuarioHipertenso;
    boolean _usuarioValido = this.hipertenso.usuarioValido();
    Assert.assertFalse(_usuarioValido);
  }
  
  @Test
  public void noPuedeComerUnVeganoDiabeticoPureConAzucar() {
    UsuarioPosta _usuarioPepe = this.getUsuarioPepe();
    UsuarioDiabetico _usuarioDiabetico = new UsuarioDiabetico(_usuarioPepe);
    this.diabetico = _usuarioDiabetico;
    UsuarioVegano _usuarioVegano = new UsuarioVegano(this.diabetico);
    this.vegano = _usuarioVegano;
    Receta _recetaPureConAzucar = this.getRecetaPureConAzucar();
    boolean _puedeComer = this.vegano.puedeComer(_recetaPureConAzucar);
    Assert.assertFalse(_puedeComer);
  }
  
  @Test
  public void noPuedeComerUnVeganoMilanesas() {
    UsuarioPosta _usuarioPepe = this.getUsuarioPepe();
    UsuarioVegano _usuarioVegano = new UsuarioVegano(_usuarioPepe);
    this.vegano = _usuarioVegano;
    Receta _recetaMilanesas = this.getRecetaMilanesas();
    boolean _puedeComer = this.vegano.puedeComer(_recetaMilanesas);
    Assert.assertFalse(_puedeComer);
  }
  
  @Test
  public void noPuedeComerUnHipertensoPureConSal() {
    UsuarioPosta _usuarioPepe = this.getUsuarioPepe();
    UsuarioHipertenso _usuarioHipertenso = new UsuarioHipertenso(_usuarioPepe);
    this.hipertenso = _usuarioHipertenso;
    Receta _recetaPureConSal = this.getRecetaPureConSal();
    boolean _puedeComer = this.hipertenso.puedeComer(_recetaPureConSal);
    Assert.assertFalse(_puedeComer);
  }
  
  @Test
  public void puedeComerUnVeganoPureConSal() {
    UsuarioPosta _usuarioPepe = this.getUsuarioPepe();
    UsuarioVegano _usuarioVegano = new UsuarioVegano(_usuarioPepe);
    this.vegano = _usuarioVegano;
    Receta _recetaPureConSal = this.getRecetaPureConSal();
    boolean _puedeComer = this.vegano.puedeComer(_recetaPureConSal);
    Assert.assertTrue(_puedeComer);
  }
  
  @Test
  public void puedeComerUnDiabeticoPureConSal() {
    UsuarioPosta _usuarioPepe = this.getUsuarioPepe();
    UsuarioDiabetico _usuarioDiabetico = new UsuarioDiabetico(_usuarioPepe);
    this.diabetico = _usuarioDiabetico;
    Receta _recetaPureConSal = this.getRecetaPureConSal();
    boolean _puedeComer = this.diabetico.puedeComer(_recetaPureConSal);
    Assert.assertTrue(_puedeComer);
  }
  
  @Test
  public void usuarioModificaUnaRecetaPropia() {
    UsuarioPosta usuario = this.getUsuarioPepe();
    Receta receta = this.getReceta(usuario, "Receta 1");
    Recetario _instance = Recetario.getInstance();
    _instance.agregar(receta);
    Map<Ingrediente, Integer> _ingredientes = receta.getIngredientes();
    Map<Condimento, Integer> _condimentos = receta.getCondimentos();
    String _explicacion = receta.getExplicacion();
    Dificultad _dificultad = receta.getDificultad();
    List<Temporada> _temporadas = receta.getTemporadas();
    usuario.modificarReceta("Receta 1", "Nuevo nombre", _ingredientes, _condimentos, _explicacion, _dificultad, _temporadas);
    String _nombre = receta.getNombre();
    Assert.assertEquals("Nuevo nombre", _nombre);
  }
  
  @Test
  public void usuarioModificaUnaRecetaNoPropia() {
    UsuarioPosta usuario = this.getUsuarioPepe();
    UsuarioPosta usuario1 = this.getUsuarioPancho();
    Receta receta = this.getReceta(usuario1, "Receta 1");
    receta.setTipo(TipoReceta.PUBLICA);
    Recetario _instance = Recetario.getInstance();
    _instance.agregar(receta);
    Map<Ingrediente, Integer> _ingredientes = receta.getIngredientes();
    Map<Condimento, Integer> _condimentos = receta.getCondimentos();
    String _explicacion = receta.getExplicacion();
    Dificultad _dificultad = receta.getDificultad();
    List<Temporada> _temporadas = receta.getTemporadas();
    usuario.modificarReceta("Receta 1", "Nuevo nombre", _ingredientes, _condimentos, _explicacion, _dificultad, _temporadas);
    String _nombre = receta.getNombre();
    Assert.assertEquals("Receta 1", _nombre);
    List<Receta> _recetas = usuario.getRecetas();
    final Function1<Receta, Boolean> _function = new Function1<Receta, Boolean>() {
      public Boolean apply(final Receta rec) {
        String _nombre = rec.getNombre();
        return Boolean.valueOf(_nombre.equals("Nuevo nombre"));
      }
    };
    boolean _exists = IterableExtensions.<Receta>exists(_recetas, _function);
    Assert.assertTrue(_exists);
  }
  
  @Test
  public void recetasQuePuedeVerUnUsuario() {
    final UsuarioPosta usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE, "Juan Carlos Lopez", Sexo.MASCULINO, this.fecha);
    final Recetario recetario = Recetario.getInstance();
    Receta _receta = this.getReceta(usuario, "Pure");
    recetario.agregar(_receta);
    List<Receta> _recetasConAcceso = usuario.getRecetasConAcceso();
    int _size = _recetasConAcceso.size();
    Assert.assertEquals(_size, 13);
  }
  
  @Test
  public void recetasQuePuedeVerUnUsuarioConGrupo() {
    final UsuarioPosta usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE, "Juan Carlos Lopez", Sexo.MASCULINO, this.fecha);
    final UsuarioPosta pepe = this.getUsuarioPepe();
    final Grupo grupo = new Grupo();
    grupo.agregar(usuario);
    grupo.agregar(pepe);
    final Recetario recetario = Recetario.getInstance();
    Receta _receta = this.getReceta(pepe, "Receta1");
    recetario.agregar(_receta);
    List<Receta> _recetasConAcceso = usuario.getRecetasConAcceso();
    int _size = _recetasConAcceso.size();
    Assert.assertEquals(_size, 13);
  }
  
  private Receta getRecetaPureConSal() {
    Receta _xblockexpression = null;
    {
      final UsuarioPosta usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE, "Juan Carlos Lopez", Sexo.MASCULINO, this.fecha);
      final String nombre = "Pure";
      final HashMap<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>();
      ingredientes.put(Ingrediente.PAPA, Integer.valueOf(1000));
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
      final Receta recetaSimple = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas);
      _xblockexpression = recetaSimple;
    }
    return _xblockexpression;
  }
  
  private Receta getRecetaPureConAzucar() {
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
  
  private Receta getRecetaMilanesas() {
    Receta _xblockexpression = null;
    {
      final UsuarioPosta usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE, "Juan Carlos Lopez", Sexo.MASCULINO, this.fecha);
      final String nombre = "Milanesas";
      final HashMap<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>();
      ingredientes.put(Ingrediente.CARNE, Integer.valueOf(1000));
      ingredientes.put(Ingrediente.HUEVO, Integer.valueOf(6));
      ingredientes.put(Ingrediente.PAN_RAYADO, Integer.valueOf(6));
      final HashMap<Condimento, Integer> condimentos = new HashMap<Condimento, Integer>();
      condimentos.put(Condimento.SAL, Integer.valueOf(10));
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
  
  private Receta getReceta(final Usuario usuario, final String nombre) {
    Receta _xblockexpression = null;
    {
      final HashMap<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>();
      ingredientes.put(Ingrediente.PAPA, Integer.valueOf(1000));
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
      final Receta receta = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas);
      receta.setTipo(TipoReceta.PRIVADA);
      _xblockexpression = receta;
    }
    return _xblockexpression;
  }
  
  private UsuarioPosta getUsuarioPepe() {
    UsuarioPosta _xblockexpression = null;
    {
      final UsuarioPosta pepe = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
      _xblockexpression = pepe;
    }
    return _xblockexpression;
  }
  
  private UsuarioPosta getUsuarioPancho() {
    UsuarioPosta _xblockexpression = null;
    {
      final UsuarioPosta pancho = new UsuarioPosta(90.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Francisco Jose Lopez", Sexo.MASCULINO, this.fecha);
      _xblockexpression = pancho;
    }
    return _xblockexpression;
  }
}
