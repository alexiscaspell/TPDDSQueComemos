package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import org.hibernate.SessionFactory
import org.hibernate.cfg.AnnotationConfiguration
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import java.util.List
import org.hibernate.HibernateException
import org.hibernate.Criteria
import org.hibernate.criterion.Restrictions
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Grupo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Login
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Administrador
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioDecorator
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioVegano
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioDiabetico
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioHipertenso
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.SujetoObservado
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ConsultasXHora
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ConsultasXSexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ConsultasXRecetas
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ConsultasXVeganos

abstract class RepoDefault<T> {

	protected static final SessionFactory sessionFactory = new AnnotationConfiguration().configure().
		addAnnotatedClass(Receta)
		.addAnnotatedClass(UsuarioPosta) // Usuario - UsuarioPosta - Diabetico.. ?
		.addAnnotatedClass(UsuarioDecorator)
		.addAnnotatedClass(UsuarioVegano)
		.addAnnotatedClass(UsuarioDiabetico)
		.addAnnotatedClass(UsuarioHipertenso)
		.addAnnotatedClass(Grupo)
		.addAnnotatedClass(Login)
		.addAnnotatedClass( SujetoObservado )
		.addAnnotatedClass( ConsultasXHora )
		.addAnnotatedClass( ConsultasXRecetas )
		.addAnnotatedClass( ConsultasXSexo )
		.addAnnotatedClass( ConsultasXVeganos )
		.addAnnotatedClass(Administrador)
		.buildSessionFactory()

	def List<T> allInstances() {
		val session = sessionFactory.openSession
		try {
			return session.createCriteria(getEntityType).list()
		} finally {
			session.close
		}
	}

	def List<T> searchByExample(T t) {
		val session = sessionFactory.openSession
		try {
			val criteria = session.createCriteria(getEntityType)
			this.addQueryByExample(criteria, t)
			return criteria.list()
		} catch (HibernateException e) {
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}

	def List<T> searchByName(String name) {
		val session = sessionFactory.openSession
		try {
			val criteria = session.createCriteria(getEntityType)
			criteria.add(Restrictions.eq("nombre", name))
			return criteria.list()
		} catch (HibernateException e) {
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}

	// Funcion Peligrosa
	def void reset() {
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			session.clear
			session.getTransaction.commit
		} catch (HibernateException e) {
			session.getTransaction.rollback
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}

	def void destroy(T t) {
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			session.delete(t)
			session.getTransaction.commit
		} catch (HibernateException e) {
			session.getTransaction.rollback
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}

	def void create(T t) {
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			session.save(t)
			session.getTransaction.commit
		} catch (HibernateException e) {
			session.getTransaction.rollback
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}

	def void update(T t) {
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			session.update(t)
			session.getTransaction.commit
		} catch (HibernateException e) {
			session.getTransaction.rollback
			throw new RuntimeException(e)
		} finally {
			session.close
		}
	}

	def abstract Class<T> getEntityType()

	def abstract void addQueryByExample(Criteria criteria, T t)

}
