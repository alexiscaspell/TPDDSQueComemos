package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.RepoUsuarios;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@SuppressWarnings("all")
public class Administrador {
  @Accessors
  private RepoUsuarios repoUsuario;
  
  private List<Usuario> colaDeEspera = new ArrayList<Usuario>();
  
  public void aceptarUsuario(final Usuario usuario) {
    this.colaDeEspera.remove(usuario);
    this.repoUsuario.add(usuario);
  }
  
  public void rechazarUsuario(final Usuario usuario, final String motivoDeRechazo) {
    this.colaDeEspera.remove(usuario);
  }
  
  public void agregarSolicitud(final Usuario usuario) {
    this.colaDeEspera.add(usuario);
  }
  
  @Pure
  public RepoUsuarios getRepoUsuario() {
    return this.repoUsuario;
  }
  
  public void setRepoUsuario(final RepoUsuarios repoUsuario) {
    this.repoUsuario = repoUsuario;
  }
}
