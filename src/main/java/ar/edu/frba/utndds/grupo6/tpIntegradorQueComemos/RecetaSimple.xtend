package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.HashMap

public class RecetaSimple extends Receta 
{
	private HashMap<Condimento, Integer> condimentos
	
	private String explicacion
	
	private int calorias
	
	private HashMap<Ingrediente, Integer> ingredientes
			
	new(Usuario usuario, 
		String nombre, 
		HashMap<Ingrediente, Integer> ingredientes, 
		HashMap<Condimento, Integer> condimentos,
		String explicacion,
		Dificultad dificultad,
		ArrayList<Temporada> temporada)
	{
		this.usuarioCreador = usuario
		this.nombre = nombre
		this.ingredientes = ingredientes
		this.condimentos = condimentos
		this.explicacion = explicacion
		this.dificultad = dificultad
		this.temporada = temporada
	}
	
	public override validar() 
	{
		if (ingredientes.values.length == 0 || getCalorias() < 5 || getCalorias() > 5000)
		{
			throw new RecetaInvalidaExc()
		}
	}
	
	override condicionesInadecuadas() 
	{
		var condicionesInadecuadas = new ArrayList<Condicion>()
		if (condimentos.containsKey(Condimento.SAL) || condimentos.containsKey(Condimento.CALDO))
		{
			condicionesInadecuadas.add(Condicion.HIPERTENSO)
		}
		
		
		
		if (cantidadDeAzucar() > 100)
		{
			condicionesInadecuadas.add(Condicion.DIABETICO)
		}
		if (ingredientes.keySet.exists[x | x.contieneCarne()])
		{
			condicionesInadecuadas.add(Condicion.VEGANO)
		}
		
		return condicionesInadecuadas
	}
	
	override cantidadDeAzucar() 
	{
		condimentos.keySet.fold(0, [acum, condimento | acum + condimento.cantidadDeAzucar(condimentos.get(condimento))])
	}
	
	override getIngredientes() {
		ingredientes
	}
	
	override getCondimentos() {
		condimentos
	}
	
	override getExplicacion() {
		explicacion
	}
	
	override getCalorias() {
		calorias
	}
	
	
	
}