package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;

@SuppressWarnings("all")
public interface Observador {
  public abstract void actualizar(final Usuario usuario);
  
  public abstract void reset();
}
