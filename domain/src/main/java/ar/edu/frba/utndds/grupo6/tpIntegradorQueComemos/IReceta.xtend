package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import java.util.Map
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento

public interface IReceta {
	
	def int getCalorias()
	
	def String getExplicacion()
	
	def void validar()
	
	def List<Condicion> condicionesInadecuadas()
	
	def int cantidadDeAzucar()
	
	def Map<Ingrediente, Integer> getIngredientes()
	
	def Map<Condimento, Integer> getCondimentos()	
	
	def void agregarSubReceta(IReceta receta)
}