package AplicationModel

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConAzucar
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaValida
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConSal
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConCarne

class UsuarioTestBuilder {
	
	
	recetaValida recetaEsValida = new recetaValida()
	recetaConAzucar recetaAzucar = new recetaConAzucar()
	recetaConSal recetaSal = new recetaConSal()
	recetaConCarne recetaCarne = new recetaConCarne()
	
	def Usuario usuarioBuilder( String nombre ){
		val usuario_test = new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, nombre , Sexo.MASCULINO)	
		usuario_test.marcarComoFavorita(recetaEsValida.cumple(usuario_test))
		usuario_test.marcarComoFavorita(recetaEsValida.noCumple(usuario_test))
		usuario_test.marcarComoFavorita(recetaAzucar.cumple(usuario_test))
		usuario_test.marcarComoFavorita(recetaAzucar.noCumple(usuario_test))
		usuario_test.marcarComoFavorita(recetaSal.cumple(usuario_test))
		usuario_test.marcarComoFavorita(recetaSal.noCumple(usuario_test))
		usuario_test.marcarComoFavorita(recetaCarne.cumple(usuario_test))
		return usuario_test
	} 
	
}