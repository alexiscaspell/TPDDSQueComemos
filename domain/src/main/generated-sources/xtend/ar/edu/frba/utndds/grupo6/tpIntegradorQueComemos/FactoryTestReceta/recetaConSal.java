package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaFactory;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.ArrayList;
import java.util.HashMap;
import queComemos.entrega3.dominio.Dificultad;

@SuppressWarnings("all")
public class recetaConSal implements recetaFactory {
  public Receta cumple(final Usuario usuario) {
    Receta _xblockexpression = null;
    {
      final String nombre = "Pure";
      final HashMap<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>();
      ingredientes.put(Ingrediente.PAPA, Integer.valueOf(1000));
      final HashMap<Condimento, Integer> condimentos = new HashMap<Condimento, Integer>();
      condimentos.put(Condimento.SAL, Integer.valueOf(10));
      condimentos.put(Condimento.ACEITE, Integer.valueOf(10));
      condimentos.put(Condimento.AZUCAR, Integer.valueOf(100));
      final String explicacion = ((("1 - Pelar las papas\n" + 
        "2 - Hervir las papas 20 minutos") + 
        "3 - Pisar las papas con un pisapapas") + 
        "4 - Condimentar");
      final ArrayList<Temporada> temporadas = new ArrayList<Temporada>();
      temporadas.add(Temporada.INVIERNO);
      temporadas.add(Temporada.OTONIO);
      temporadas.add(Temporada.PRIMAVERA);
      temporadas.add(Temporada.VERANO);
      final Receta recetaSimple = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas);
      recetaSimple.setCalorias(100);
      _xblockexpression = recetaSimple;
    }
    return _xblockexpression;
  }
  
  public Receta noCumple(final Usuario usuario) {
    Receta _xblockexpression = null;
    {
      final String nombre = "Frutillas a la crema";
      final HashMap<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>();
      ingredientes.put(Ingrediente.FRUTILLA, Integer.valueOf(1000));
      final HashMap<Condimento, Integer> condimentos = new HashMap<Condimento, Integer>();
      condimentos.put(Condimento.CREMA, Integer.valueOf(500));
      condimentos.put(Condimento.AZUCAR, Integer.valueOf(800));
      final String explicacion = ((("1 - Cortar las frutillas\n" + 
        "2 - Preparar crema") + 
        "3 - Agregar azucar a las frutillas") + 
        "4 - Servir las frutillas junto con la crema");
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
}
