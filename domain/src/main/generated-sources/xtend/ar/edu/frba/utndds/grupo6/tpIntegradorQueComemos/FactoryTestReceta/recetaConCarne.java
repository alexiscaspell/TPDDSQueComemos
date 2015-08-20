package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConAzucar;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaFactory;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.ArrayList;
import java.util.HashMap;
import queComemos.entrega3.dominio.Dificultad;

@SuppressWarnings("all")
public class recetaConCarne implements recetaFactory {
  public Receta cumple(final Usuario usuario) {
    Receta _xblockexpression = null;
    {
      final String nombre = "Milanesas";
      final HashMap<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>();
      ingredientes.put(Ingrediente.CARNE, Integer.valueOf(1000));
      ingredientes.put(Ingrediente.HUEVO, Integer.valueOf(6));
      ingredientes.put(Ingrediente.PAN_RAYADO, Integer.valueOf(6));
      final HashMap<Condimento, Integer> condimentos = new HashMap<Condimento, Integer>();
      condimentos.put(Condimento.SAL, Integer.valueOf(10));
      condimentos.put(Condimento.ACEITE, Integer.valueOf(10));
      final String explicacion = ((("1 - Cortar la carne\n" + 
        "2 - Pasar la carne por el huevo") + 
        "3 - Pasar la carne por pan rayado") + 
        "4 - Hornear 25 minutos");
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
  
  public Receta noCumple(final Usuario usuario) {
    Receta _xblockexpression = null;
    {
      recetaConAzucar rec = new recetaConAzucar();
      _xblockexpression = rec.cumple(usuario);
    }
    return _xblockexpression;
  }
}
