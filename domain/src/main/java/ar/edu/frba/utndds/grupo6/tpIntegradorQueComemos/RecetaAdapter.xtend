package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

public class RecetaAdapter {

	def Receta getReceta(queComemos.entrega3.dominio.Receta rec) {
		val receta = new Receta()
		receta.setNombre(rec.getNombre());
		receta.setTiempoPreparacion(rec.getTiempoPreparacion());
		receta.setCalorias(rec.getTotalCalorias());
		receta.setDificultad(rec.getDificultadReceta());
		receta.setUsuarioCreador(rec.getAutor())
		receta.setAnio(rec.getAnioReceta())
		return receta;
	}
}
