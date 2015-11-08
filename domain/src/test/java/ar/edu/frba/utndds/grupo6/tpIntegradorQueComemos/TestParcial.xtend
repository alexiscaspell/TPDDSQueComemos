package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.text.DateFormat
import java.util.Date
import java.text.SimpleDateFormat
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.UsuariosRepository
import org.junit.Test

class MongoTest {
	
	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	Date fecha = format.parse("01-04-1970")
	val pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
	UsuariosRepository repoUsuarios = new UsuariosRepository( "Usuarios" )
	
	@Test
	def guardarUsuario(){
		repoUsuarios.create( pepe )
	}
}