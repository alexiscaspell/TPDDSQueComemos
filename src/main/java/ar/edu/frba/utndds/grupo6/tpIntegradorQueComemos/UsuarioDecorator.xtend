package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Date

@Accessors
abstract class UsuarioDecorator implements Usuario {
	
	Usuario decorado
	
	new(Usuario usuario) {
		decorado = usuario
	}
	
	override setNombre(String unNombre){
		decorado.setNombre(unNombre)
	}
	
	override agregarUsuario(String nombre, double peso, double altura, Date fechaNacimiento, int rutinaUsuario){
		decorado.agregarUsuario(nombre,peso,altura,fechaNacimiento,rutinaUsuario)
	}
	
	override setFechaNacimiento(Date unaFecha){
		decorado.setFechaNacimiento(unaFecha)		
	}
	
	override estadoRutina(){
		decorado.estadoRutina()
	}
	
	override calcularIMC(){
		decorado.calcularIMC()
	}
	
	override getPeso(){
		decorado.getPeso()
	}
	
	override getAltura(){
		decorado.getAltura()
	}
	
	override getPreferenciasAlimenticias(){
		decorado.getPreferenciasAlimenticias()
	}
	
	override getRutina(){
		decorado.getRutina()
		
	}
	
	override cumpleCondicion(){
		decorado.cumpleCondicion()
	}
	
	override nombreCorrecto(){
		decorado.nombreCorrecto
	}
	
	override cumpleCamposObligatorios(){
		decorado.cumpleCamposObligatorios()
	}
	
	override usuarioValido(){
		decorado.usuarioValido()
	}
}