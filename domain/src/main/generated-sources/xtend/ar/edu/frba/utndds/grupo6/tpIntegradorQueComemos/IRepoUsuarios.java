package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.List;

@SuppressWarnings("all")
public interface IRepoUsuarios {
  public abstract void add(final Usuario usuario);
  
  public abstract void remove(final Usuario usuario);
  
  public abstract void update(final Usuario usuario);
  
  public abstract Usuario get(final Usuario usuario);
  
  public abstract List<Usuario> list(final Usuario usuario);
}
