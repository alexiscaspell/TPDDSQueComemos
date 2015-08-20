package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaFactory;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.TipoReceta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.ArrayList;
import java.util.HashMap;
import queComemos.entrega3.dominio.Dificultad;

@SuppressWarnings("all")
public class recetaPublica implements recetaFactory {
  public Receta cumple(final Usuario usuario) {
    Receta _xblockexpression = null;
    {
      final String nombre = "Torta";
      final HashMap<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>();
      ingredientes.put(Ingrediente.HARINA, Integer.valueOf(1000));
      ingredientes.put(Ingrediente.HUEVO, Integer.valueOf(3));
      final HashMap<Condimento, Integer> condimentos = new HashMap<Condimento, Integer>();
      condimentos.put(Condimento.AZUCAR, Integer.valueOf(100));
      condimentos.put(Condimento.ACEITE, Integer.valueOf(10));
      final String explicacion = "No se hacer una torta";
      final ArrayList<Temporada> temporadas = new ArrayList<Temporada>();
      temporadas.add(Temporada.INVIERNO);
      temporadas.add(Temporada.OTONIO);
      temporadas.add(Temporada.PRIMAVERA);
      temporadas.add(Temporada.VERANO);
      final Receta recetaSimple = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas);
      recetaSimple.setTipo(TipoReceta.PUBLICA);
      _xblockexpression = recetaSimple;
    }
    return _xblockexpression;
  }
  
  public Receta noCumple(final Usuario usuario) {
    Receta _xblockexpression = null;
    {
      final String nombre = "Torta";
      final HashMap<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>();
      ingredientes.put(Ingrediente.HARINA, Integer.valueOf(1000));
      ingredientes.put(Ingrediente.HUEVO, Integer.valueOf(3));
      final HashMap<Condimento, Integer> condimentos = new HashMap<Condimento, Integer>();
      condimentos.put(Condimento.AZUCAR, Integer.valueOf(100));
      condimentos.put(Condimento.ACEITE, Integer.valueOf(10));
      final String explicacion = "No se hacer una torta";
      final ArrayList<Temporada> temporadas = new ArrayList<Temporada>();
      temporadas.add(Temporada.INVIERNO);
      temporadas.add(Temporada.OTONIO);
      temporadas.add(Temporada.PRIMAVERA);
      temporadas.add(Temporada.VERANO);
      final Receta recetaSimple = new Receta(usuario, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas);
      recetaSimple.setTipo(TipoReceta.PRIVADA);
      _xblockexpression = recetaSimple;
    }
    return _xblockexpression;
  }
}
