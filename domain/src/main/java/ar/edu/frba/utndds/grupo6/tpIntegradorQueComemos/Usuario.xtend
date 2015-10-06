package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.util.List

public interface Usuario {

	//	------------------------------------------- Setters -------------------------------------------
	def void setNombre(String nombre)

	def void setLogin(Login login)

	//	------------------------------------------- Getters -------------------------------------------
	def Login getLogin()

	def List<Receta> getConsultas()

	def Sexo getSexo()

	def double getIMC()

	def List<String> getPlatosQueNoLeGustan()

	def String getEmail()

	def String getNombre()

	//def List<Condicion> getCondicion()
	def Rutina getRutina()

	def double getPeso()

	def void marcarComoFavorita(Receta receta)

	def List<Receta> getFavoritas()

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

	def void addObservador(Observador observador)

	def void removeObservador(Observador observador)

	def List<Observador> getObservadores()
}
