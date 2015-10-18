package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import org.hibernate.SessionFactory
import org.hibernate.cfg.AnnotationConfiguration
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import java.util.List
import org.hibernate.HibernateException
import org.hibernate.Criteria

abstract class RepoDefault<T> {
	
		private static final SessionFactory sessionFactory = new 
	AnnotationConfiguration().configure()
			.addAnnotatedClass( Receta )
			.addAnnotatedClass( Usuario ) // Usuario - UsuarioPosta - Diabetico.. ?
			.buildSessionFactory()
			
		
		def List<T> allInstances() {
			val session = sessionFactory.openSession
			try {
				return session.createCriteria( getEntityType ).list()
			} finally {
				session.close
			}
		}
		
		def List<T> searchByExample( T t ){
		val session = sessionFactory.openSession
		try {
			val criteria = session.createCriteria( getEntityType )
			this.addQueryByExample( criteria, t )
			return criteria.list()
		} catch ( HibernateException e ) {
			throw new RuntimeException( e )
		} finally {
			session.close 
		}
	}
	
	def void create( T t ){
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			session.save( t )
			session.getTransaction.commit 
		} catch ( HibernateException e ){
			session.getTransaction.rollback
			throw new RuntimeException( e ) 
		} finally {
			session.close 
		}
	}
	
	def void update( T t ){
		val session = sessionFactory.openSession
		try {
			session.beginTransaction
			session.update( t )
			session.getTransaction.commit 
		} catch ( HibernateException e ){
			session.getTransaction.rollback 
			throw new RuntimeException( e )
		} finally {
			session.close 
		}
	}
	
	def abstract Class<T> getEntityType()
	
	def abstract void addQueryByExample( Criteria criteria, T t )
}