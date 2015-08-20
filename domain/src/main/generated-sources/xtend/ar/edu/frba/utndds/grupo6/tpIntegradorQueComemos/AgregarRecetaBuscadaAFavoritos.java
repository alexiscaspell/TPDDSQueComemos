package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ICommandRepoUsuario;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.RepoUsuarios;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("all")
public class AgregarRecetaBuscadaAFavoritos implements ICommandRepoUsuario {
  /**
   * INSTANCIAS
   */
  private RepoUsuarios repositorio;
  
  private Usuario usuario;
  
  private List<Receta> recetasBuscadas = new ArrayList<Receta>();
  
  /**
   * FUNCIONES
   */
  public AgregarRecetaBuscadaAFavoritos(final RepoUsuarios repositorio, final Usuario usuario) {
    this.repositorio = repositorio;
    this.usuario = usuario;
  }
  
  public void agregarRecetaBuscadaAFavoritos(final Receta receta) {
    this.recetasBuscadas.add(receta);
  }
  
  public void ejecutar() {
    List<Receta> _recetasBuscadasFavoritas = this.usuario.getRecetasBuscadasFavoritas();
    _recetasBuscadasFavoritas.addAll(this.recetasBuscadas);
    this.recetasBuscadas.clear();
    this.repositorio.update(this.usuario);
  }
}
