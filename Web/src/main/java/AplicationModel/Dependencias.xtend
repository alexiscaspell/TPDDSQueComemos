package AplicationModel

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConAzucar
import queComemos.entrega3.dominio.Dificultad
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import java.util.ArrayList
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ConsultasXRecetas
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Recetario
import java.util.HashMap
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento

@Accessors
class Dependencias {
	public static val repoUsuarios = new Repositorio()
	public static val repoRecetas = Recetario.getInstance()
	public static Usuario usuario_aux
	public static recetaConAzucar recetaAzucar = new recetaConAzucar()
	val static temporadasReceta1 = new ArrayList<Temporada>();
	val static temporadasReceta2 = new ArrayList<Temporada>();
	val static condimentosReceta1 = new HashMap<Condimento, Integer>();
	val static condimentosReceta2 = new HashMap<Condimento, Integer>();
	public static ConsultasXRecetas consultasXRecetas = new ConsultasXRecetas()

	public static def hardcodear() {

		var Receta receta1 = new Receta
		var Receta receta2 = new Receta
		receta1.nombre = "Papa"
		receta1.dificultad = Dificultad.FACIL
		receta1.calorias = 500

		temporadasReceta1.add(Temporada.INVIERNO)
		temporadasReceta1.add(Temporada.OTONIO)

		condimentosReceta1.put(Condimento.AZUCAR, 10);
		condimentosReceta1.put(Condimento.CALDO, 20);

		receta1.temporadas = temporadasReceta1;
		receta1.condimentos = condimentosReceta1;

		receta2.nombre = "Carne"
		receta2.dificultad = Dificultad.MEDIANA
		receta2.calorias = 250

		usuario_aux.marcarComoFavorita(receta1)

		temporadasReceta2.add(Temporada.PRIMAVERA)
		temporadasReceta2.add(Temporada.VERANO)

		condimentosReceta2.put(Condimento.AZUCAR, 10);
		condimentosReceta2.put(Condimento.CALDO, 20);

		receta2.temporadas = temporadasReceta2;
		receta2.condimentos = condimentosReceta2;

		usuario_aux.addObservador(consultasXRecetas)
		usuario_aux.marcarComoFavorita(receta2)
	}
}
