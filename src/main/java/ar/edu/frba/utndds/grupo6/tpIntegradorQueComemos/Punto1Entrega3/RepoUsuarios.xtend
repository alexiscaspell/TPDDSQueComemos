package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Punto1Entrega3

import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.model.Entity
import java.util.List

public class RepoUsuarios extends CollectionBasedHome{
	
	override protected getCriterio(Entity arg0) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getEntityType() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	/**********************FUNCIONES******************************/
	
	public def void add(UsuarioEntity usuario){
		effectiveCreate(usuario)		
	}
	
	public def void remove(UsuarioEntity usuario){
		effectiveDelete(usuario)
	}
	
	public def Entity get(UsuarioEntity usuario){
		
		val List<Entity> listaUsuario = searchByExample(usuario)
		return listaUsuario.head
	} 
	
	public def List<Entity> list(UsuarioEntity usuario){
		return searchByExample(usuario)
	}
 
}