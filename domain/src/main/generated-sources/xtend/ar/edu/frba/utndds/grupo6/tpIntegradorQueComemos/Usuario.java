package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Grupo;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Observador;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("all")
public interface Usuario {
  public abstract void setNombre(final String nombre);
  
  public abstract List<Receta> getConsultas();
  
  public abstract Sexo getSexo();
  
  public abstract List<String> getPlatosQueNoLeGustan();
  
  public abstract String getEmail();
  
  public abstract String getNombre();
  
  public abstract Rutina getRutina();
  
  public abstract double getPeso();
  
  public abstract ArrayList<Observador> getObservadores();
  
  public abstract List<Ingrediente> getPreferenciasAlimenticias();
  
  public abstract List<Receta> getRecetas();
  
  public abstract List<Receta> getRecetasConAcceso();
  
  public abstract List<Receta> getRecetasBuscadasFavoritas();
  
  public abstract void agregarGrupo(final Grupo grupo);
  
  public abstract boolean puedeComer(final Receta receta);
  
  public abstract boolean comparteGrupo(final Usuario usuario);
  
  public abstract boolean estadoRutina();
  
  public abstract boolean usuarioValido();
  
  public abstract boolean sePuedeSugerir(final Receta receta);
  
  public abstract boolean esVegano();
  
  public abstract boolean esHipertenso();
  
  public abstract boolean esDiabetico();
  
  public abstract Boolean cumpleMismasCondiciones(final Usuario usuario);
  
  public abstract Usuario crearPerfil();
}
