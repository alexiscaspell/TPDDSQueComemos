package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import com.mongodb.DB
import com.mongodb.Mongo
import org.junit.Test
import org.jongo.Jongo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import java.text.SimpleDateFormat

class MongoTest {

	@Test
	def guardarUsuario() {
		var mongo = new Mongo()
		var database = new DB(mongo, "TestJackson")
		var jongo = new Jongo(database);
		var usuarios = jongo.getCollection("Usuarios");
//		var format = new SimpleDateFormat("dd-mm-yyyy")
//		var fecha = format.parse("01-04-1970")
//		val pepe = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, "Juan Jose Lopez", Sexo.MASCULINO, fecha)
//		usuarios.save(pepe);
		var all = usuarios.find("{}").^as(typeof(Usuario))
		while (all.hasNext())
		{
			var usuario = all.next();
			println(usuario.nombre);
		}		
		var asd = "";
	}
}
