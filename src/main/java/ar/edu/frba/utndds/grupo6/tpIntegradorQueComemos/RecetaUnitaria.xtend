package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList

public class RecetaUnitaria extends Receta 
{	
	public override validar() 
	{
		if (ingredientes.values.length == 0 || getCalorias() < 5 || getCalorias() > 5000)
		{
			throw new RecetaInvalidaExc()
		}
	}
	
	override condicionesInadecuadas() {
		var condicionesInadecuadas = new ArrayList<Condicion>()
		if (condimentos.containsKey(Condimento.SAL) || condimentos.containsKey(Condimento.CALDO))
		{
			condicionesInadecuadas.add(Condicion.HIPERTENSO)
		}
		if (condimentos.containsKey(Condimento.AZUCAR) && condimentos.get(Condimento.AZUCAR) > 100)
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
	
}