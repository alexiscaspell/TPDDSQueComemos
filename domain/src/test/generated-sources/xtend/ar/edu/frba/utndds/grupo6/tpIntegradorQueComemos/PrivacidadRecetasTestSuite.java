package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaPublica;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.junit.Assert;
import org.junit.Test;

@SuppressWarnings("all")
public class PrivacidadRecetasTestSuite {
  private DateFormat format = new SimpleDateFormat("dd-mm-yyyy");
  
  private Date fecha = new Function0<Date>() {
    public Date apply() {
      try {
        Date _parse = PrivacidadRecetasTestSuite.this.format.parse("01-04-1970");
        return _parse;
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    }
  }.apply();
  
  private recetaPublica recetaEsPublica = new recetaPublica();
  
  private Usuario usuario1 = this.getUsuario1();
  
  private Usuario usuario2 = this.getUsuario2();
  
  @Test
  public void Usuario1ModificaRecetaDeUsuario1() {
    Receta _noCumple = this.recetaEsPublica.noCumple(this.usuario1);
    boolean _puedeModificar = _noCumple.puedeModificar(this.usuario1);
    Assert.assertTrue(_puedeModificar);
  }
  
  @Test
  public void Usuario2NoPuedeModificarRecetaDeUsuario1() {
    Receta _noCumple = this.recetaEsPublica.noCumple(this.usuario1);
    boolean _puedeModificar = _noCumple.puedeModificar(this.usuario2);
    Assert.assertFalse(_puedeModificar);
  }
  
  @Test
  public void Usuario2ModificaRecetaUsuario1PorSerPublica() {
    Receta _cumple = this.recetaEsPublica.cumple(this.usuario2);
    boolean _puedeModificar = _cumple.puedeModificar(this.usuario2);
    Assert.assertTrue(_puedeModificar);
  }
  
  public Usuario getUsuario1() {
    return new UsuarioPosta(82, 1.78, Rutina.LEVE, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
  }
  
  public Usuario getUsuario2() {
    return new UsuarioPosta(90, 1.62, Rutina.MEDIANO, "Pablo Lopez", Sexo.MASCULINO, this.fecha);
  }
}
