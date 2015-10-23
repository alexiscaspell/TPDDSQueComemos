package AplicationModel

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConAzucar
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConCarne
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConSal
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaValida
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioDiabetico
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import queComemos.entrega3.dominio.Dificultad
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ConsultasXRecetas
import java.util.ArrayList
import java.util.HashMap
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.TipoReceta

@Accessors
class UsuarioTestBuilder {

	//Calendar calendar = Calendar.getInstance();
	Date fecha = new Date()
	recetaValida recetaEsValida = new recetaValida()
	recetaConAzucar recetaAzucar = new recetaConAzucar()
	recetaConSal recetaSal = new recetaConSal()
	recetaConCarne recetaCarne = new recetaConCarne()
	val static temporadasReceta1 = new ArrayList<Temporada>();
	val static temporadasReceta2 = new ArrayList<Temporada>();
	val static condimentosReceta1 = new HashMap<Condimento, Integer>();
	val static condimentosReceta2 = new HashMap<Condimento, Integer>();
	val static ingredientesReceta1 = new HashMap<Ingrediente, Integer>();
	val static ingredientesReceta2 = new HashMap<Ingrediente, Integer>();
	public static ConsultasXRecetas consultasXRecetas = new ConsultasXRecetas()
	
	/*def UsuarioPosta usuarioBuilder( String nombre ){
		if ( nombre == "Lucas" ) return new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, nombre , Sexo.MASCULINO)
		else if ( nombre == "Mariano" ) return new UsuarioPosta(210.4, 1.40, Rutina.INTENSIVO, nombre , Sexo.MASCULINO) 
	} */
	def Usuario usuarioBuilder(String nombre) {

		val Usuario usuario_test = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, nombre, Sexo.MASCULINO,
			fecha)
		
		usuario_test.preferenciasAlimenticias.add(Ingrediente.POLLO)
		usuario_test.preferenciasAlimenticias.add(Ingrediente.ALGA)

		usuario_test.platosQueNoLeGustan.add("pizza")
		usuario_test.platosQueNoLeGustan.add("fideos")

		var Receta receta1 = new Receta
		var Receta receta2 = new Receta
		receta1.nombre = "Papa"
		receta1.dificultad = Dificultad.FACIL
		receta1.calorias = 500
		receta1.usuarioCreador = "test"
		receta1.tipo = TipoReceta.PUBLICA
		receta2.usuarioCreador = "test"
		receta2.tipo = TipoReceta.PUBLICA
	
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

		usuario_test.marcarComoFavorita(receta1)

		temporadasReceta2.add(Temporada.PRIMAVERA)
		temporadasReceta2.add(Temporada.VERANO)

		condimentosReceta2.put(Condimento.AZUCAR, 10);
		condimentosReceta2.put(Condimento.CALDO, 20);

		receta2.temporadas = temporadasReceta2;
		receta2.condimentos = condimentosReceta2;
		receta2.explicacion = "Explicación de la receta 2";

		usuario_test.addObservador(consultasXRecetas)
		usuario_test.marcarComoFavorita(receta2)
		return usuario_test
	}

}
