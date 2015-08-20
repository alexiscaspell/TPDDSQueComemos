package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos
import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion

class FabricaPerfilUsuario {
	
	val List<Condicion> condiciones
	
	val UsuarioPosta usuario
	
	var Usuario usuarioCreado
	
	new( List<Condicion> condiciones,UsuarioPosta usuario){
		
		this.condiciones = condiciones	
		
		this.usuario = usuario
	}
	
	def Usuario crearPerfil(){
		
		usuarioCreado = usuario
		
		if(condiciones.contains(Condicion.VEGANO))
		usuarioCreado = new UsuarioVegano(usuarioCreado)
		
		if(condiciones.contains(Condicion.HIPERTENSO))
		usuarioCreado = new UsuarioHipertenso(usuarioCreado)
		
		if(condiciones.contains(Condicion.DIABETICO))
		usuarioCreado = new UsuarioDiabetico(usuarioCreado)
		
		return usuarioCreado
		
	}
}

