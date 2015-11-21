package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.TipoReceta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.RecetasRepository
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.UsuariosRepository
import java.text.SimpleDateFormat
import java.util.HashSet
import org.junit.Test
import queComemos.entrega3.dominio.Dificultad

class TestInicial {

	@Test
	def guardarUsuario() {
		var format = new SimpleDateFormat("dd-mm-yyyy")
		var fecha = format.parse("01-04-1970")
		val pepe = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, fecha)
		pepe.nickName = "tpdds"
		pepe.password = "tpdds"
		
		var receta = new Receta()
		receta.agregarCondimento(Condimento.ACEITE, 100)
		receta.agregarCondimento(Condimento.AZUCAR, 200)
		receta.agregarCondimento(Condimento.CALDO, 300)
		receta.agregarIngrediente(Ingrediente.ACELGA, 10)
		receta.agregarIngrediente(Ingrediente.AJO, 20)
		receta.agregarIngrediente(Ingrediente.ARROZ_YAMANI, 30)
		receta.anio = 2015
		receta.calorias = 100;
		receta.dificultad = Dificultad.FACIL
		receta.tipo = TipoReceta.PUBLICA 
		receta.explicacion = ""
		receta.temporadas = new HashSet();
		receta.temporadas.add(Temporada.INVIERNO)
		receta.usuarioCreador = pepe.nickName
		receta.nombre = "Receta 1"
		pepe.recetas.add(receta)
		pepe.favoritas.add(receta)
		
		var repoRecetas = new RecetasRepository()
		repoRecetas.create(receta)
		var repo = new UsuariosRepository()
		repo.create(pepe)
		
		//Sin esta linea el Test no corre
		var asd = "";
	}
}