package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.RepoUsuarios;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import queComemos.entrega3.dominio.Dificultad;

@SuppressWarnings("all")
public class RecetaAdapter {
  public Receta getReceta(final queComemos.entrega3.dominio.Receta rec) {
    final Receta receta = new Receta();
    String _nombre = rec.getNombre();
    receta.setNombre(_nombre);
    int _tiempoPreparacion = rec.getTiempoPreparacion();
    receta.setTiempoPreparacion(_tiempoPreparacion);
    int _totalCalorias = rec.getTotalCalorias();
    receta.setCalorias(_totalCalorias);
    Dificultad _dificultadReceta = rec.getDificultadReceta();
    receta.setDificultad(_dificultadReceta);
    final RepoUsuarios repoUsuarios = new RepoUsuarios();
    String _autor = rec.getAutor();
    final Usuario usuario = repoUsuarios.get(_autor);
    receta.setUsuarioCreador(usuario);
    int _anioReceta = rec.getAnioReceta();
    receta.setAnio(_anioReceta);
    return receta;
  }
}
