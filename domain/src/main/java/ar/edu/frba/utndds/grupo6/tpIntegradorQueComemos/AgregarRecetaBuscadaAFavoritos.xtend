package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.RepoUsuarios
import java.util.ArrayList
import java.util.List

class AgregarRecetaBuscadaAFavoritos implements ICommandRepoUsuario{
	
	/********************INSTANCIAS**************************/
	private RepoUsuarios repositorio
	
	private Usuario usuario
	
	private List<Receta> recetasBuscadas = new ArrayList<Receta>()
	
	
	/********************FUNCIONES**************************/
	
	new(RepoUsuarios repositorio, Usuario usuario){
		this.repositorio = repositorio
		this.usuario = usuario
	}
	
	def void agregarRecetaBuscadaAFavoritos(Receta receta){
		this.recetasBuscadas.add(receta)
	}
	
	override ejecutar() {
		usuario.recetasBuscadasFavoritas.addAll(recetasBuscadas)
		recetasBuscadas.clear()
		
		repositorio.update(usuario)		
	}
	
}