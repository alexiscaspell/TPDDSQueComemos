package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;

@SuppressWarnings("all")
public interface Consumidor {
  public abstract boolean sePuedeSugerir(final Receta receta);
}
