package AplicationModel

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ConsultasXRecetas
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.TipoReceta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Recetario
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import java.util.ArrayList
import java.util.HashMap
import org.eclipse.xtend.lib.annotations.Accessors
import queComemos.entrega3.dominio.Dificultad
import java.util.Date
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.UsuariosRepository
import FiltrosConsultasRecetas.Filtrador
import Pedidos.PedidoEnumsSistema
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.RecetasRepository
import java.util.List
import java.util.HashSet

@Accessors
class Dependencias {
	//public static val repoUsuarios = new Repositorio()
	//public static val repoRecetas = Recetario.getInstance()
	public static val usuariosRepository = UsuariosRepository.getInstance;
	public static val recetasRepository = RecetasRepository.getInstance;
	
	public static Usuario usuario
	//val static temporadasReceta1 = new ArrayList<Temporada>();
	//val static temporadasReceta2 = new ArrayList<Temporada>();
	//val static condimentosReceta1 = new HashMap<Condimento, Integer>();
	//val static condimentosReceta2 = new HashMap<Condimento, Integer>();
	//val static ingredientesReceta1 = new HashMap<Ingrediente, Integer>();
	//val static ingredientesReceta2 = new HashMap<Ingrediente, Integer>();
	public static ConsultasXRecetas consultasXRecetas = new ConsultasXRecetas()

	//------------------CONSULTAS RECETAS--------------------------
	public static Filtrador filtrador = new Filtrador()

	public static PedidoEnumsSistema enumsSistema = new PedidoEnumsSistema()

	public static def newRecetasFiltradas() { //Recetas hardcodeadas,esto viene de repoRecetas

		//val ListadoRecetas listado = new ListadoRecetas()

		//return listado.recetas
		
		val String creador = "Lucas"
		val nombre = "Milanesas"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.CARNE, 1000)
		ingredientes.put(Ingrediente.HUEVO, 6)
		ingredientes.put(Ingrediente.PAN_RAYADO, 6)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.SAL, 10)
		condimentos.put(Condimento.ACEITE, 10)
		val explicacion = 
			"1 - Cortar la carne\n" /*+ 
			"2 - Pasar la carne por el huevo" +
			"3 - Pasar la carne por pan rayado" 
			+ "4 - Hornear 25 minutos" */
		val temporadas = new HashSet<Temporada>()
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)
		val recetaSimple = new Receta(creador, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL,
			temporadas)
		recetaSimple.tipo = TipoReceta.PUBLICA
		
		var List<Receta> recetasHard = new ArrayList<Receta>
		
		recetasHard.add(recetaSimple)
		
		return recetasHard
	}

	//--------------CONSULTAS RECETAS-----------------------
	/*
	public static def hardcodear() {
		val Usuario usuario = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan", Sexo.MASCULINO,
			new Date(1989, 6, 5))
		
		var Receta receta1 = new Receta
		var Receta receta2 = new Receta
		receta1.nombre = "Papa"
		receta1.dificultad = Dificultad.FACIL
		receta1.calorias = 500
		receta1.usuarioCreador = usuario.nickName
		receta1.tipo = TipoReceta.PUBLICA
		receta2.usuarioCreador = usuario.nickName
		receta2.tipo = TipoReceta.PUBLICA
	
		usuario.platosQueNoLeGustan.add("Pizza")

		temporadasReceta1.add(Temporada.INVIERNO)
		temporadasReceta1.add(Temporada.OTONIO)

		condimentosReceta1.put(Condimento.AZUCAR, 10);
		condimentosReceta1.put(Condimento.CALDO, 20);

		ingredientesReceta1.put(Ingrediente.AJO, 20)
		ingredientesReceta2.put(Ingrediente.AJO, 20)

		receta1.temporadas = temporadasReceta1;
		receta1.condimentos = condimentosReceta1;
		receta1.ingredientes = ingredientesReceta1;
		receta1.explicacion = "Explicación de la receta 1";

		receta2.nombre = "Carne"
		receta2.dificultad = Dificultad.MEDIANA
		receta2.calorias = 250
		receta2.ingredientes = ingredientesReceta2

		usuario.marcarComoFavorita(receta1)

		temporadasReceta2.add(Temporada.PRIMAVERA)
		temporadasReceta2.add(Temporada.VERANO)

		condimentosReceta2.put(Condimento.AZUCAR, 10);
		condimentosReceta2.put(Condimento.CALDO, 20);

		receta2.temporadas = temporadasReceta2;
		receta2.condimentos = condimentosReceta2;
		receta2.explicacion = "Explicación de la receta 2";

		usuario.addObservador(consultasXRecetas)
		usuario.marcarComoFavorita(receta2)
		return usuario
	} */
}
