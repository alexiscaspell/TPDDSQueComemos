package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion
import java.util.Date
import java.util.Map
import queComemos.entrega3.dominio.Dificultad
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Inheritance
import javax.persistence.InheritanceType
import javax.persistence.GenerationType
import java.util.Set

@Entity
abstract class Usuario extends SujetoObservado {
	
	/*
	@Id
	@GeneratedValue ( strategy = GenerationType.TABLE )
	public long id
	*/
	

	//	------------------------------------------- Setters -------------------------------------------
	def void setNombre(String nombre)

	def void setLogin(Login login)
	
	def void setNickName(String nickName)
	
	def void setPassword(String pass)

	//	------------------------------------------- Getters -------------------------------------------
	
	def String getNickName()
	
	def String getPassword()
	
	def Login getLogin()

	def List<Receta> getConsultas()

	def Sexo getSexo()

	def double getIMC()

	def Date getFechaDeNacimiento()

	def List<String> getPlatosQueNoLeGustan()

	def String getEmail()

	def String getNombre()

	def List<Condicion> getCondicion()

	def Rutina getRutina()

	def double getPeso()

	def void marcarComoFavorita(Receta receta)

	def Set<Receta> getFavoritas()

	def List<Ingrediente> getPreferenciasAlimenticias()

	def List<Receta> getRecetas()

	def List<Receta> getRecetasConAcceso()

	def List<Receta> getRecetasBuscadasFavoritas()

	//	------------------------------------------- Metodos -------------------------------------------
	def void agregarGrupo(Grupo grupo)

	def boolean puedeComer(Receta receta)

	def boolean comparteGrupo(Usuario usuario)

	def boolean estadoRutina()

	def boolean usuarioValido()

	def boolean sePuedeSugerir(Receta receta)

	def boolean esVegano()

	def boolean esHipertenso()

	def boolean esDiabetico()

	def Boolean cumpleMismasCondiciones(Usuario usuario)

	def Usuario crearPerfil()
	
	def boolean cumpleCondicion(Receta receta)
	/*
	def void addObservador(Observador observador)

	def void removeObservador(Observador observador)

	def List<Observador> getObservadores()
	 */
	def void modificarReceta(String nombreRecetaAModificar, String nombreReceta, Map<Ingrediente, Integer> ingredientes,
		Map<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad, List<Temporada> temporada)
	

	

	
}
