package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;

@SuppressWarnings("all")
public interface recetaFactory {
  public abstract Receta cumple(final Usuario usuario);
  
  public abstract Receta noCumple(final Usuario usuario);
}
