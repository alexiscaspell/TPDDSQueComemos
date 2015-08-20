package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ConsultasXHora;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ConsultasXRecetas;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ConsultasXSexo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ConsultasXVeganos;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConAzucar;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConCarne;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConSal;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Recetario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioVegano;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class MonitoreoConsultasTestSuite {
  private DateFormat format = new SimpleDateFormat("dd-mm-yyyy");
  
  private Date fecha = new Function0<Date>() {
    public Date apply() {
      try {
        Date _parse = MonitoreoConsultasTestSuite.this.format.parse("01-04-1970");
        return _parse;
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    }
  }.apply();
  
  private Calendar calendario = Calendar.getInstance();
  
  private Recetario recetario = Recetario.getInstance();
  
  private recetaConAzucar recetaAzucar = new recetaConAzucar();
  
  private recetaConSal recetaSal = new recetaConSal();
  
  private recetaConCarne recetaCarne = new recetaConCarne();
  
  private ConsultasXSexo ConsultasXSexo = new ConsultasXSexo();
  
  private ConsultasXRecetas ConsultasXRecetas = new ConsultasXRecetas();
  
  private ConsultasXVeganos ConsultasXVeganos = new ConsultasXVeganos();
  
  private ConsultasXHora ConsultasXHora = new ConsultasXHora();
  
  private Usuario usuarioFemenino;
  
  private Usuario usuarioMasculino;
  
  @Before
  public void SetUp() {
    Recetario _instance = Recetario.getInstance();
    _instance.reset();
    UsuarioVegano _usuarioFemenino = this.getUsuarioFemenino();
    this.usuarioFemenino = _usuarioFemenino;
    UsuarioPosta _usuarioMasculino = this.getUsuarioMasculino();
    this.usuarioMasculino = _usuarioMasculino;
  }
  
  @Test
  public void CantidadDeConsultasTest() {
    this.seteoRecetario();
    this.usuarioFemenino.getRecetasConAcceso();
    this.usuarioMasculino.getRecetasConAcceso();
    Map<String, Integer> _estadistica = this.ConsultasXRecetas.getEstadistica();
    Integer _get = _estadistica.get("Milanesas");
    Assert.assertEquals((_get).intValue(), 1);
    Map<String, Integer> _estadistica_1 = this.ConsultasXRecetas.getEstadistica();
    Integer _get_1 = _estadistica_1.get("Torta");
    Assert.assertEquals((_get_1).intValue(), 3);
    Map<String, Integer> _estadistica_2 = this.ConsultasXRecetas.getEstadistica();
    Integer _get_2 = _estadistica_2.get("Pure");
    Assert.assertEquals((_get_2).intValue(), 3);
    Map<Integer, Integer> _estadistica_3 = this.ConsultasXHora.getEstadistica();
    int _get_3 = this.calendario.get(Calendar.HOUR_OF_DAY);
    Integer _get_4 = _estadistica_3.get(Integer.valueOf(_get_3));
    Assert.assertEquals((_get_4).intValue(), 2);
  }
  
  @Test
  public void CantidadDeConsultasXSexoTest() {
    this.seteoRecetario();
    this.usuarioFemenino.getRecetasConAcceso();
    this.usuarioMasculino.getRecetasConAcceso();
    Map<String, Integer> _estadisticaFemenino = this.ConsultasXSexo.getEstadisticaFemenino();
    Integer _get = _estadisticaFemenino.get("Milanesas");
    Assert.assertEquals((_get).intValue(), 1);
    Map<String, Integer> _estadisticaFemenino_1 = this.ConsultasXSexo.getEstadisticaFemenino();
    Integer _get_1 = _estadisticaFemenino_1.get("Torta");
    Assert.assertEquals((_get_1).intValue(), 2);
    Map<String, Integer> _estadisticaMasculino = this.ConsultasXSexo.getEstadisticaMasculino();
    Integer _get_2 = _estadisticaMasculino.get("Pure");
    Assert.assertEquals((_get_2).intValue(), 2);
    Map<String, Integer> _estadisticaMasculino_1 = this.ConsultasXSexo.getEstadisticaMasculino();
    Integer _get_3 = _estadisticaMasculino_1.get("Milanesas");
    Assert.assertEquals((_get_3).intValue(), 0);
  }
  
  @Test
  public void CantiadDeConsultasXHora() {
    this.seteoRecetario();
    this.usuarioFemenino.getRecetasConAcceso();
    this.usuarioMasculino.getRecetasConAcceso();
    Map<Integer, Integer> _estadistica = this.ConsultasXHora.getEstadistica();
    int _get = this.calendario.get(Calendar.HOUR_OF_DAY);
    Integer _get_1 = _estadistica.get(Integer.valueOf(_get));
    boolean _equals = ((_get_1).intValue() == 2);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void CantidadDeConsultasXVeganos() {
    this.seteoRecetario();
    this.usuarioFemenino.getRecetasConAcceso();
    this.usuarioMasculino.getRecetasConAcceso();
    int _estadistica = this.ConsultasXVeganos.getEstadistica();
    Assert.assertEquals(_estadistica, 2);
  }
  
  public boolean seteoRecetario() {
    boolean _xblockexpression = false;
    {
      Receta _cumple = this.recetaSal.cumple(this.usuarioMasculino);
      this.recetario.agregar(_cumple);
      Receta _cumple_1 = this.recetaAzucar.cumple(this.usuarioFemenino);
      this.recetario.agregar(_cumple_1);
      Receta _cumple_2 = this.recetaCarne.cumple(this.usuarioFemenino);
      _xblockexpression = this.recetario.agregar(_cumple_2);
    }
    return _xblockexpression;
  }
  
  public UsuarioPosta getUsuarioMasculino() {
    final UsuarioPosta pepe = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    Receta _cumple = this.recetaSal.cumple(this.usuarioMasculino);
    pepe.agregarReceta(_cumple);
    pepe.addObservador(this.ConsultasXSexo);
    pepe.addObservador(this.ConsultasXRecetas);
    pepe.addObservador(this.ConsultasXVeganos);
    pepe.addObservador(this.ConsultasXHora);
    return pepe;
  }
  
  public UsuarioVegano getUsuarioFemenino() {
    final UsuarioPosta mariana = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Mariana Lopez", Sexo.FEMENINO, this.fecha);
    Receta _cumple = this.recetaAzucar.cumple(this.usuarioFemenino);
    mariana.agregarReceta(_cumple);
    final UsuarioVegano vegano = new UsuarioVegano(mariana);
    vegano.addObservador(this.ConsultasXSexo);
    vegano.addObservador(this.ConsultasXRecetas);
    vegano.addObservador(this.ConsultasXHora);
    vegano.addObservador(this.ConsultasXVeganos);
    return vegano;
  }
}
