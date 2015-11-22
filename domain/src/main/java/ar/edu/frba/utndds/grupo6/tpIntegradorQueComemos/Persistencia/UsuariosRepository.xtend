package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import java.util.List

public class UsuariosRepository extends MongoDBRepository<Usuario> {

	new() {
		super("Usuario")
	}
	
	def List<Usuario> list(Usuario usuario) {
	}

	def List<Usuario> login(String name, String pass) {
	}
	
	// Hago el field collection publico para poder usarlo aca
	def Usuario searchByNickYPass(String nick, String pass) {
		var user = collection.findOne("{nickName: '"+nick+"'}").^as(getEntityType)
		if (user.password == pass)
		{
			return user;
		}
		return null;
	}
	
	override getEntityType() {
		return typeof(Usuario)
	}
	
	def updateRecetasContenidas( Usuario usuario, Receta receta ) {
		
		// Por ahora es para un usuario, pero deberia ser para todos
		// Se puede justificar que por performance el de todos los usuarios 
		// se hace aparte cada 24 horas o algo asi
		val Receta recetaFavoritaARemplazar = usuario.favoritas.findFirst[ it.get_id == receta.get_id ]
		val Receta recetaARemplazar = usuario.recetas.findFirst[ it.get_id == receta.get_id ]
		usuario.favoritas.remove( recetaFavoritaARemplazar )
		usuario.favoritas.add( receta )
		usuario.recetas.remove( recetaARemplazar )
		usuario.recetas.add( receta )
		collection.update( usuario.get_id ).with( usuario ) 
	}
}
