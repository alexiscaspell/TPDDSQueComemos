package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import java.util.ArrayList;
import java.util.Map;

@SuppressWarnings("all")
public interface IReceta {
  public abstract int getCalorias();
  
  public abstract String getExplicacion();
  
  public abstract void validar();
  
  public abstract ArrayList<Condicion> condicionesInadecuadas();
  
  public abstract int cantidadDeAzucar();
  
  public abstract Map<Ingrediente, Integer> getIngredientes();
  
  public abstract Map<Condimento, Integer> getCondimentos();
  
  public abstract void agregarSubReceta(final IReceta receta);
}
