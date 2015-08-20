package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Excepciones.RecetaInvalidaExc;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConAzucar;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConCarne;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConSal;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaValida;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioDiabetico;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.junit.Assert;
import org.junit.Test;

@SuppressWarnings("all")
public class RecetasTestSuite {
  private DateFormat format = new SimpleDateFormat("dd-mm-yyyy");
  
  private Date fecha = new Function0<Date>() {
    public Date apply() {
      try {
        Date _parse = RecetasTestSuite.this.format.parse("01-04-1970");
        return _parse;
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    }
  }.apply();
  
  private recetaConSal recetaSal = new recetaConSal();
  
  private recetaConCarne recetaCarne = new recetaConCarne();
  
  private recetaValida recetaEsValida = new recetaValida();
  
  private recetaConAzucar recetaAzucar = new recetaConAzucar();
  
  private final UsuarioPosta usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE, "Juan Carlos Lopez", Sexo.MASCULINO, this.fecha);
  
  @Test
  public void sugerenciaAUnUsuarioDeUnaReceta() {
    List<Ingrediente> _ingredientesFeos = this.usuario.getIngredientesFeos();
    _ingredientesFeos.add(Ingrediente.CARNE);
    Receta _cumple = this.recetaAzucar.cumple(this.usuario);
    boolean _sePuedeSugerir = this.usuario.sePuedeSugerir(_cumple);
    Assert.assertTrue(_sePuedeSugerir);
  }
  
  @Test
  public void noSePuedeSugerirUnaRecetaAUnUsuario() {
    List<Ingrediente> _ingredientesFeos = this.usuario.getIngredientesFeos();
    _ingredientesFeos.add(Ingrediente.PAPA);
    Receta _cumple = this.recetaSal.cumple(this.usuario);
    boolean _sePuedeSugerir = this.usuario.sePuedeSugerir(_cumple);
    Assert.assertFalse(_sePuedeSugerir);
  }
  
  @Test
  public void noSePuedeSugerirUnaTortaAUnDiabetico() {
    final UsuarioDiabetico usuarioDiabetico = new UsuarioDiabetico(this.usuario);
    Receta _cumple = this.recetaAzucar.cumple(this.usuario);
    boolean _sePuedeSugerir = usuarioDiabetico.sePuedeSugerir(_cumple);
    Assert.assertFalse(_sePuedeSugerir);
  }
  
  /**
   * def void recetaInvalidaPorDemasiadasCalorias()
   * {
   * val usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE,"Juan Carlos Lopez",Sexo.MASCULINO,fecha)
   * val nombre = "Receta 1"
   * val ingredientes = new HashMap<Ingrediente, Integer>()
   * ingredientes.put(Ingrediente.PAPA, 1000)
   * val condimentos = new HashMap<Condimento, Integer>()
   * condimentos.put(Condimento.SAL, 10)
   * val explicacion = "1 - Paso 1\n" +
   * "2 - Paso 2\n" +
   * "3 - Paso 3\n" +
   * "4 - Paso 4\n"
   * val temporadas = new ArrayList<Temporada>()
   * temporadas.add(Temporada.INVIERNO)
   * val invalida = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
   * invalida.calorias = 6000
   * invalida.validar()
   * }
   */
  @Test(expected = RecetaInvalidaExc.class)
  public void recetaInvalidaPorNoTenerIngredientes() {
    final Receta receta = this.recetaEsValida.noCumple(this.usuario);
    receta.validar();
  }
  
  @Test
  public void recetaPure() {
    final Receta pure = this.recetaSal.cumple(this.usuario);
    int _cantidadDeAzucar = pure.cantidadDeAzucar();
    Assert.assertEquals(100, _cantidadDeAzucar, 0.01);
  }
  
  @Test
  public void crearRecetaMilanesasConPure() {
    final Receta pure = this.recetaSal.cumple(this.usuario);
    final Receta milanesasConPure = this.recetaCarne.cumple(this.usuario);
    milanesasConPure.agregarSubReceta(pure);
    int _cantidadDeAzucar = milanesasConPure.cantidadDeAzucar();
    Assert.assertEquals(100, _cantidadDeAzucar, 0.01);
  }
  
  @Test
  public void cantidadIngredientesPure() {
    final Receta pure = this.recetaSal.cumple(this.usuario);
    Map<Ingrediente, Integer> _ingredientes = pure.getIngredientes();
    int _size = _ingredientes.size();
    boolean _equals = (_size == 1);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void cantidadIngredientesMilanesasConPure() {
    final Receta pure = this.recetaSal.cumple(this.usuario);
    final Receta milanesasConPure = this.recetaCarne.cumple(this.usuario);
    milanesasConPure.agregarSubReceta(pure);
    Map<Ingrediente, Integer> _ingredientes = milanesasConPure.getIngredientes();
    Collection<Integer> _values = _ingredientes.values();
    int _length = ((Object[])Conversions.unwrapArray(_values, Object.class)).length;
    boolean _equals = (_length == 4);
    Assert.assertTrue(_equals);
  }
}
