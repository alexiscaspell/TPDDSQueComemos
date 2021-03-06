package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import java.util.Map
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import queComemos.entrega3.dominio.Dificultad
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import javax.persistence.Entity
import javax.persistence.OneToOne
import javax.persistence.FetchType
import javax.persistence.CascadeType
import java.util.Set

@Entity
@Accessors
public abstract class UsuarioDecorator extends Usuario implements  Consumidor {

	@OneToOne ( fetch = FetchType.EAGER, cascade=CascadeType.ALL )
	Usuario decorado

	new(Usuario usuario) {
		decorado = usuario
	}
	
	new(){
	}

	//	------------------------------------------- Setters -------------------------------------------
	override setNombre(String nombre) {

		decorado.setNombre(nombre)
	}
	
	override  setLogin(Login login){
		
		decorado.setLogin(login)
	}
	

	override void setNickName(String nickName){
		
		decorado.nickName = nickName
	}
	
	override void setPassword(String pass){
		
		decorado.password = pass
	}

	//	------------------------------------------- Getters -------------------------------------------
	//override getCondicion(){
	//decorado.getCondicion()
	//}
	
	override String getNickName(){
		
		decorado.nickName
	}
	
	override String getPassword(){
		
		decorado.password
	}
	
	override getRecetasConAcceso(){
		decorado.recetasConAcceso
	}
	
	override getCondicion(){
		decorado.getCondicion()
	}
	
	override getFechaDeNacimiento(){
		decorado.getFechaDeNacimiento()
	}
	
	override getLogin(){
		
		decorado.getLogin()
	}
	override getPeso() {
		decorado.getPeso()
	}

	override getIMC(){
		decorado.getIMC()
	}

	override getEmail() {
		decorado.getEmail()
	}

	override getNombre() {
		decorado.getNombre()
	}

	override getFavoritas() {
		decorado.getFavoritas()
	}

	override getConsultas() {
		decorado.getConsultas()
	}

	override getPlatosQueNoLeGustan() {
		decorado.getPlatosQueNoLeGustan
	}

	override getPreferenciasAlimenticias() {
		decorado.getPreferenciasAlimenticias()
	}

	override getSexo() {
		decorado.getSexo()
	}

	override getRutina() {
		decorado.getRutina()
	}

	override List<Receta> getRecetas() {
		decorado.getRecetas()
	}

	//	------------------------------------------- Metodos -------------------------------------------
	override usuarioValido() {
		decorado.usuarioValido()
	}

	override consultarPorReceta( Receta receta ){
		decorado.consultarPorReceta( receta )
	}

	override comparteGrupo(Usuario usuario) {
		decorado.comparteGrupo(usuario)
	}

	override puedeComer(Receta receta) {
		return ( cumpleCondicion(receta) && decorado.puedeComer(receta) )
	}

	override boolean cumpleCondicion(Receta receta){
		
		decorado.cumpleCondicion(receta)
	}

	override sePuedeSugerir(Receta receta) {
		return ( puedeComer(receta) && decorado.sePuedeSugerir(receta) )
	}

	override agregarGrupo(Grupo grupo) {
		decorado.agregarGrupo(grupo)
	}
	
	override void marcarComoFavorita( Receta receta ){
		
		decorado.marcarComoFavorita(receta)
	}
	
	override modificarReceta(String nombreRecetaAModificar, String nombreReceta, Map<Ingrediente, Integer> ingredientes,
		Map<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad, Set<Temporada> temporada) {
		decorado.modificarReceta(nombreRecetaAModificar, nombreReceta, ingredientes, condimentos, explicacion,
			dificultad, temporada);
	}

// ------------------------------------------------ Metodos Observer y Alternativa------------------------------------------------
}
