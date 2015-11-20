package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import com.fasterxml.jackson.annotation.JsonSubTypes
import com.fasterxml.jackson.annotation.JsonTypeInfo
import java.util.Date
import java.util.List
import java.util.Map
import java.util.Set
import queComemos.entrega3.dominio.Dificultad

@JsonTypeInfo(use=JsonTypeInfo.Id.NAME, include=JsonTypeInfo.As.PROPERTY, property="type")
@JsonSubTypes(@JsonSubTypes.Type(value=typeof(UsuarioPosta), name="UsuarioPosta"))
public abstract class Usuario extends SujetoObservado {	
	
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

	//def List<Receta> getRecetasBuscadasFavoritas()

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
	
	def void consultarPorReceta( Receta receta )
	
	def boolean cumpleCondicion(Receta receta)
	/*
	def void addObservador(Observador observador)

	def void removeObservador(Observador observador)

	def List<Observador> getObservadores()
	 */
	def void modificarReceta(String nombreRecetaAModificar, String nombreReceta, Map<Ingrediente, Integer> ingredientes,
		Map<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad, Set<Temporada> temporada)
	

	

	
}
