package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import java.util.HashMap

public class RecetaSimple extends Receta 
{		
	new(Usuario usuario, 
		String nombre, 
		HashMap<Ingrediente, Integer> ingredientes, 
		HashMap<Condimento, Integer> condimentos,
		String explicacion,
		Dificultad dificultad,
		ArrayList<Temporada> temporada)
	{
		//TODO: Calcular las calorías al cargar los datos
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
		if (condimentos.containsKey(Condimento.AZUCAR) && cantidadDeAzucar() > 100)
		{
			condicionesInadecuadas.add(Condicion.DIABETICO)
		}
		if (ingredientes.containsKey(Ingrediente.POLLO) || ingredientes.containsKey(Ingrediente.CARNE) || ingredientes.containsKey(Ingrediente.CHIVITO)
			|| ingredientes.containsKey(Ingrediente.CHORI))
		{
			condicionesInadecuadas.add(Condicion.VEGANO)			
		}
		return condicionesInadecuadas
	}
	
	override cantidadDeAzucar() 
	{
		if (condimentos.containsKey(Condimento.AZUCAR))
		{
			return condimentos.get(Condimento.AZUCAR)
		}
		return 0
	}
	
}