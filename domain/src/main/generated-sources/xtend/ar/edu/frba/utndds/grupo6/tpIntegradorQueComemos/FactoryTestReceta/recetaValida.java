package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConSal;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaFactory;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.ArrayList;
import java.util.HashMap;
import queComemos.entrega3.dominio.Dificultad;

@SuppressWarnings("all")
public class recetaValida implements recetaFactory {
  public Receta noCumple(final Usuario usuario) {
    Receta _xblockexpression = null;
    {
      final String nombre = "RecetaVacia";
      final HashMap<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>();
      final HashMap<Condimento, Integer> condimentos = new HashMap<Condimento, Integer>();
      final String explicacion = ("1 - Nada\n" + 
        "2 - Nada otra vez");
      final ArrayList<Temporada> temporadas = new ArrayList<Temporada>();
      temporadas.add(Temporada.INVIERNO);
      temporadas.add(Temporada.OTONIO);
      temporadas.add(Temporada.PRIMAVERA);
      temporadas.add(Temporada.VERANO);
      final Receta recetaSimple = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas);
      _xblockexpression = recetaSimple;
    }
    return _xblockexpression;
  }
  
  public Receta cumple(final Usuario usuario) {
    Receta _xblockexpression = null;
    {
      recetaConSal rec = new recetaConSal();
      _xblockexpression = rec.cumple(usuario);
    }
    return _xblockexpression;
  }
}
