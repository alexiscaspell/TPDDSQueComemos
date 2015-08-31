package ar.edu.frba.utndds.grupo6.ui.tpIntegradorQueComemos

import org.uqbar.arena.widgets.Panel

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class PanelReceta extends SimpleWindow<Receta>{

	new(WindowOwner parent, Receta receta) 
	{
		super(parent, receta)
	}

	override protected createFormPanel(Panel mainPanel) 
	{
		this.setTitle("Detalle de Receta")
		
		// Panel Superior
		new Panel(mainPanel) => [		
			new Label(it).bindValueToProperty("nombre")
			
			new Panel( it ) => [
				layout = new HorizontalLayout
				new Label(it).bindValueToProperty("calorias")	
				new Label(it).bindValueToProperty("autor")
			]	
		]
			
		// Panel Medio
		new Panel( mainPanel ) => [
			layout = new HorizontalLayout			
			new Panel( it ) => [
				new Label(it).text = "Dificultad"
				new Label(it).bindValueToProperty("dificultad")
				new Label(it).text = "Ingredientes"
				new Table(it, Receta )
				new CheckBox(it)	
			]
			new Panel( it ) => [
				new Label(it).text = "Temporada"
//				new Label(it).bindValueToProperty("temporada")
				new Label(it).text = "Condimentos"
				new List(it)
				new Label(it).text = "Condiciones Preexistentes"
				new List(it)
			]
		]
		
		// Panel Inferior
		new Panel(mainPanel) => [
			new Label(it).text = "Proceso de Preparacion"
			new Label(it).bindValueToProperty("explicacion")			   	 						
		]
					
	}
	
	override protected addActions(Panel actionsPanel) 
	{
		new Button( actionsPanel ) => [
				it.caption = "Volver"
			]		
	}
	
}