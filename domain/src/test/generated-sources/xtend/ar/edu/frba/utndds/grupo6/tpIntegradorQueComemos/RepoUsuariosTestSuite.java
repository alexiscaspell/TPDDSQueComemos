package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Administrador;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FabricaPerfilUsuario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.RepoUsuarios;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioVegano;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function0;
import org.junit.Assert;
import org.junit.Test;

@SuppressWarnings("all")
public class RepoUsuariosTestSuite {
  private Administrador admin = new Administrador();
  
  private RepoUsuarios repositorio = new RepoUsuarios();
  
  private List<Condicion> listaCondicion;
  
  private DateFormat format = new SimpleDateFormat("dd-mm-yyyy");
  
  private Date fecha = new Function0<Date>() {
    public Date apply() {
      try {
        Date _parse = RepoUsuariosTestSuite.this.format.parse("01-04-1970");
        return _parse;
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    }
  }.apply();
  
  private FabricaPerfilUsuario fabrica;
  
  private Usuario usuarioFabricado;
  
  private Usuario user;
  
  private UsuarioPosta pepe = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
  
  @Test
  public void agregarUsuarioARepoUsuarios() {
    this.admin.agregarSolicitud(this.pepe);
    this.admin.setRepoUsuario(this.repositorio);
    this.admin.aceptarUsuario(this.pepe);
    Usuario _get = this.repositorio.get(this.pepe);
    this.user = _get;
    boolean _equals = this.user.equals(this.pepe);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void agregarUsuarioConCondicionesARepoUsuarios() {
    UsuarioPosta _usuarioPosta = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, this.fecha);
    this.pepe = _usuarioPosta;
    List<Condicion> _asList = Arrays.<Condicion>asList(Condicion.VEGANO, Condicion.DIABETICO);
    this.listaCondicion = _asList;
    FabricaPerfilUsuario _fabricaPerfilUsuario = new FabricaPerfilUsuario(this.listaCondicion, this.pepe);
    this.fabrica = _fabricaPerfilUsuario;
    Usuario _crearPerfil = this.fabrica.crearPerfil();
    this.usuarioFabricado = _crearPerfil;
    this.admin.agregarSolicitud(this.usuarioFabricado);
    this.admin.setRepoUsuario(this.repositorio);
    this.admin.aceptarUsuario(this.usuarioFabricado);
    Usuario _get = this.repositorio.get(this.usuarioFabricado);
    this.user = _get;
    boolean _equals = this.user.equals(this.user);
    Assert.assertTrue(_equals);
  }
  
  @Test
  public void actualizarUsuarioConCondicionesARepoUsuarios() {
    List<Condicion> _asList = Arrays.<Condicion>asList(Condicion.VEGANO);
    this.listaCondicion = _asList;
    final FabricaPerfilUsuario fabrica2 = new FabricaPerfilUsuario(this.listaCondicion, this.pepe);
    final Usuario userVegano = fabrica2.crearPerfil();
    this.repositorio.add(userVegano);
    List<Condicion> _asList_1 = Arrays.<Condicion>asList(Condicion.VEGANO, Condicion.DIABETICO);
    this.listaCondicion = _asList_1;
    FabricaPerfilUsuario _fabricaPerfilUsuario = new FabricaPerfilUsuario(this.listaCondicion, this.pepe);
    this.fabrica = _fabricaPerfilUsuario;
    final Usuario userVeganoDiabetico = this.fabrica.crearPerfil();
    this.repositorio.update(userVeganoDiabetico);
    Usuario _get = this.repositorio.get(userVeganoDiabetico);
    this.user = _get;
    boolean _and = false;
    Boolean _existe = this.repositorio.existe(userVegano);
    boolean _not = (!(_existe).booleanValue());
    if (!_not) {
      _and = false;
    } else {
      boolean _equals = this.user.equals(userVeganoDiabetico);
      _and = _equals;
    }
    Assert.assertTrue(_and);
  }
  
  @Test
  public void listUsuarioConCondicionesEnRepoUsuarios() {
    List<Condicion> _asList = Arrays.<Condicion>asList(Condicion.VEGANO);
    this.listaCondicion = _asList;
    FabricaPerfilUsuario _fabricaPerfilUsuario = new FabricaPerfilUsuario(this.listaCondicion, this.pepe);
    this.fabrica = _fabricaPerfilUsuario;
    final Usuario vegano = this.fabrica.crearPerfil();
    List<Condicion> _asList_1 = Arrays.<Condicion>asList(Condicion.DIABETICO);
    this.listaCondicion = _asList_1;
    final FabricaPerfilUsuario fabrica2 = new FabricaPerfilUsuario(this.listaCondicion, this.pepe);
    final Usuario diabetico = fabrica2.crearPerfil();
    this.repositorio.add(diabetico);
    this.repositorio.add(vegano);
    final List<Usuario> listaUsuarios = this.repositorio.list(vegano);
    boolean _and = false;
    boolean _contains = listaUsuarios.contains(vegano);
    if (!_contains) {
      _and = false;
    } else {
      boolean _contains_1 = listaUsuarios.contains(diabetico);
      boolean _not = (!_contains_1);
      _and = _not;
    }
    Assert.assertTrue(_and);
  }
  
  @Test
  public void crearPerfilDeUsuarioClonaYNoReferencia() {
    final UsuarioVegano vegano = new UsuarioVegano(this.pepe);
    final Usuario clonVegano = vegano.crearPerfil();
    clonVegano.setNombre("Satan");
    String _nombre = vegano.getNombre();
    String _nombre_1 = clonVegano.getNombre();
    boolean _equals = _nombre.equals(_nombre_1);
    Assert.assertFalse(_equals);
  }
}
