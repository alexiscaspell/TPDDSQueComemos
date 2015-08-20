package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Observador;
import java.util.ArrayList;

@SuppressWarnings("all")
public abstract class SujetoObservado {
  private ArrayList<Observador> Observadores = new ArrayList<Observador>();
  
  public boolean addObservador(final Observador observador) {
    return this.Observadores.add(observador);
  }
  
  public boolean removeObservador(final Observador observador) {
    return this.Observadores.remove(observador);
  }
  
  public ArrayList<Observador> getObservadores() {
    return this.Observadores;
  }
  
  public abstract void notificar();
}
