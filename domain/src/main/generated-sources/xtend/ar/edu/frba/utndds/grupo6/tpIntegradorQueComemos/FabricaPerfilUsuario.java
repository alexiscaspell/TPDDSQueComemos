package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioDiabetico;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioHipertenso;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioVegano;
import java.util.List;

@SuppressWarnings("all")
public class FabricaPerfilUsuario {
  private final List<Condicion> condiciones;
  
  private final UsuarioPosta usuario;
  
  private Usuario usuarioCreado;
  
  public FabricaPerfilUsuario(final List<Condicion> condiciones, final UsuarioPosta usuario) {
    this.condiciones = condiciones;
    this.usuario = usuario;
  }
  
  public Usuario crearPerfil() {
    this.usuarioCreado = this.usuario;
    boolean _contains = this.condiciones.contains(Condicion.VEGANO);
    if (_contains) {
      UsuarioVegano _usuarioVegano = new UsuarioVegano(this.usuarioCreado);
      this.usuarioCreado = _usuarioVegano;
    }
    boolean _contains_1 = this.condiciones.contains(Condicion.HIPERTENSO);
    if (_contains_1) {
      UsuarioHipertenso _usuarioHipertenso = new UsuarioHipertenso(this.usuarioCreado);
      this.usuarioCreado = _usuarioHipertenso;
    }
    boolean _contains_2 = this.condiciones.contains(Condicion.DIABETICO);
    if (_contains_2) {
      UsuarioDiabetico _usuarioDiabetico = new UsuarioDiabetico(this.usuarioCreado);
      this.usuarioCreado = _usuarioDiabetico;
    }
    return this.usuarioCreado;
  }
}
