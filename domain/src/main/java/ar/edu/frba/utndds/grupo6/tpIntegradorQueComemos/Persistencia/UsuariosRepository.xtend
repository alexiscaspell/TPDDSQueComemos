package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import org.hibernate.Criteria
import java.util.List
import org.hibernate.criterion.Restrictions
import org.hibernate.HibernateException

class UsuariosRepository extends RepoDefault<Usuario> {

	private static UsuariosRepository instance

	static def getInstance() {
		if (instance == null) {
			instance = new UsuariosRepository()
		}
		return instance
	}

	override getEntityType() {
		typeof(Usuario)
	}

	override addQueryByExample(Criteria criteria, Usuario t) {

		// Sobre que criteria se busca, habria un solo tipo de busqueda?
		if (t.nickName != null && t.password != null) {
			criteria.add(Restrictions.eq("nickName", t.nickName))
			criteria.add(Restrictions.eq("password", t.password))
		}
	}

	def existe(Usuario usuario) {
		! searchByName(usuario.nombre).empty
	}

	def List<Usuario> list(Usuario usuario) {

		val listaUsuariosConElMismoNombre = searchByName(usuario.nombre)
		return listaUsuariosConElMismoNombre.filter[usuarioFiltrado|usuarioFiltrado.cumpleMismasCondiciones(usuario)].
			toList
	}

	def List<Usuario> login(String name, String pass) 
	{
		val session = sessionFactory.openSession
		try 
		{
			val criteria = session.createCriteria(typeof(Usuario))
			criteria.add(Restrictions.eq("nickName", name))
			criteria.add(Restrictions.eq("password", pass))
			return criteria.list()
		} 
		catch (HibernateException e) 
		{
			throw new RuntimeException(e)
		} 
		finally 
		{
			session.close
		}
	}
}
