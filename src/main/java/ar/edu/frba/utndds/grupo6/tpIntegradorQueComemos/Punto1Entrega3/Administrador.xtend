package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Punto1Entrega3
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.model.CollectionBasedHome
class Administrador {
	
	private List<Usuario> colaDeEspera = new ArrayList<Usuario>()
	
	def void add(){
		
		val usuario = colaDeEspera.remove(0)
		
		//effectiveCreate(usuario)
		
	}
	
	public def void agregarSolicitud(Usuario usuario){
		
		colaDeEspera.add(usuario)
	}
	
	
	
}