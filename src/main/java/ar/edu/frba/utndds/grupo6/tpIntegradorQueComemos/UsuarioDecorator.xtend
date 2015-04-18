package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class UsuarioDecorator implements Usuario {
	
	Usuario decorado
	
	new(Usuario usuario) {
		decorado = usuario
	}
	
	override estadoRutina(){
		decorado.estadoRutina()
	}
	
	override calcularIMC(){
		decorado.calcularIMC()
	}
}