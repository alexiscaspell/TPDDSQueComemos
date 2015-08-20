package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.RecetaAdapter;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Recetario;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import queComemos.entrega3.dominio.Receta;
import queComemos.entrega3.repositorio.BusquedaRecetas;
import queComemos.entrega3.repositorio.RepoRecetas;

@SuppressWarnings("all")
public class RecetasExternasTestSuite {
  private RepoRecetas repo;
  
  private Gson gson;
  
  private RecetaAdapter adapter;
  
  @Before
  public void SetUp() {
    RepoRecetas _repoRecetas = new RepoRecetas();
    this.repo = _repoRecetas;
    Gson _gson = new Gson();
    this.gson = _gson;
    RecetaAdapter _recetaAdapter = new RecetaAdapter();
    this.adapter = _recetaAdapter;
    Recetario _instance = Recetario.getInstance();
    _instance.reset();
  }
  
  @Test
  public void ObtencionDeTodasLasRecetas() {
    BusquedaRecetas _busquedaRecetas = new BusquedaRecetas();
    final String recetas = this.repo.getRecetas(_busquedaRecetas);
    final ArrayList<Receta> listRecetas = new ArrayList<Receta>();
    JsonParser _jsonParser = new JsonParser();
    JsonElement _parse = _jsonParser.parse(recetas);
    final Consumer<JsonElement> _function = new Consumer<JsonElement>() {
      public void accept(final JsonElement x) {
        final Receta recetaGson = RecetasExternasTestSuite.this.gson.<Receta>fromJson(x, Receta.class);
        listRecetas.add(recetaGson);
      }
    };
    ((JsonArray) _parse).forEach(_function);
    int _size = listRecetas.size();
    Assert.assertEquals(_size, 12);
  }
  
  @Test
  public void ConversionDeRecetasConAdapter() {
    BusquedaRecetas _busquedaRecetas = new BusquedaRecetas();
    final String recetas = this.repo.getRecetas(_busquedaRecetas);
    final ArrayList<Receta> listRecetas = new ArrayList<Receta>();
    JsonParser _jsonParser = new JsonParser();
    JsonElement _parse = _jsonParser.parse(recetas);
    final Consumer<JsonElement> _function = new Consumer<JsonElement>() {
      public void accept(final JsonElement x) {
        final Receta recetaGson = RecetasExternasTestSuite.this.gson.<Receta>fromJson(x, Receta.class);
        listRecetas.add(recetaGson);
      }
    };
    ((JsonArray) _parse).forEach(_function);
    final ArrayList<ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta> recetasAdaptadas = new ArrayList<ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta>();
    final Consumer<Receta> _function_1 = new Consumer<Receta>() {
      public void accept(final Receta receta) {
        ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta _receta = RecetasExternasTestSuite.this.adapter.getReceta(receta);
        recetasAdaptadas.add(_receta);
      }
    };
    listRecetas.forEach(_function_1);
    int _size = listRecetas.size();
    int _size_1 = recetasAdaptadas.size();
    Assert.assertEquals(_size, _size_1);
  }
  
  @Test
  public void ObtencionDeRecetasExternasDelRecetario() {
    final Recetario recetario = Recetario.getInstance();
    final List<ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta> recetasExternas = recetario.getRecetasExternas();
    int _size = recetasExternas.size();
    Assert.assertEquals(_size, 12);
  }
}
