package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

public class RecetaAdapter {

	def Receta getReceta(queComemos.entrega3.dominio.Receta rec) {
		val receta = new Receta()
		receta.setNombre(rec.getNombre());
		receta.setTiempoPreparacion(rec.getTiempoPreparacion());
		receta.setCalorias(rec.getTotalCalorias());
		receta.setDificultad(rec.getDificultadReceta());
		val repoUsuarios = new ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.RepoUsuarios()
		val usuario = repoUsuarios.get(rec.getAutor());
		receta.setUsuarioCreador(usuario)
		receta.setAnio(rec.getAnioReceta())
		return receta;
	}
}
