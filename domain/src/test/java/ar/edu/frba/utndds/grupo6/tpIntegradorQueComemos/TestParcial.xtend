package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.UsuariosRepository
import java.text.SimpleDateFormat
import org.junit.Test

class MongoTest {

	@Test
	def guardarUsuario() {
		var format = new SimpleDateFormat("dd-mm-yyyy")
		var fecha = format.parse("01-04-1970")
		val pepe = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, fecha)
		var repo = new UsuariosRepository("Usuario")
		repo.create(pepe)
		
		//Sin esta linea el Test no corre
		var asd = "";
	}
}
