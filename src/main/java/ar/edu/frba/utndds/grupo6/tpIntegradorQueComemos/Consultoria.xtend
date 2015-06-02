package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.Calendar
import java.util.HashMap
import java.util.List
import java.util.Map
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import queComemos.entrega3.dominio.Dificultad
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion

public class Consultoria {
	
	private Calendar calendario = Calendar.getInstance();
	private static Consultoria instance;
	// Esctructuras para guardar las consultas
	private Map< Integer , Integer> consultasXHora 
	private Map< String, Integer > recetasConsultadas 
	private Map< String, Integer > consultasXFemenino 
	private Map< String, Integer > consultasXMasculino 
	private int consultasXVeganos 
	
	def void actualizar( UsuarioPosta usuario, List<String> consultas ){
		println( usuario.getNombre() )
		consultas.forEach[
			switch ( it ){
				case "ConsultasXHora": 
					if ( consultasXHora.containsKey( calendario.get(Calendar.HOUR_OF_DAY ) )) {
						consultasXHora.put( calendario.get( Calendar.HOUR_OF_DAY ) , consultasXHora.get(calendario.get( Calendar.HOUR_OF_DAY )) + 1 )	
					} else {
						consultasXHora.put( calendario.get( Calendar.HOUR_OF_DAY ), 1 )
					}
					
				case "ConsultasXRecetas":
					usuario.getConsultas().forEach[
						if ( ! recetasConsultadas.containsKey( it.nombre )) recetasConsultadas.put( it.nombre, 1 )
						else recetasConsultadas.put(  it.nombre , recetasConsultadas.get( it.nombre ) + 1)
					]
					
				case "ConsultasXSexo":
					usuario.getConsultas().forEach[
						if ( ! consultasXFemenino.containsKey( it.nombre )) consultasXFemenino.put( it.nombre, 0 )
						if ( ! consultasXMasculino.containsKey( it.nombre )) consultasXMasculino.put( it.nombre, 0 )
						if ( usuario.sexo == Sexo.FEMENINO ){	
							consultasXFemenino.put( it.nombre , consultasXFemenino.get( it.nombre ) + 1)
						} else  consultasXMasculino.put( it.nombre , consultasXMasculino.get( it.nombre ) + 1)
					]	
				
				case "ConsultasXVegano":
					if ( usuario.getCondicion().contains( Condicion.VEGANO ) ) {
						println("ES VEGANA")
						usuario.getConsultas().forEach[ if ( it.getDificultad() == Dificultad.DIFICIL ) consultasXVeganos++ ]
					} }
					//if ( usuario.getCondicion().contains( Condicion.VEGANO ) ) {
						//usuario.getConsultas().forEach[ if ( it.getDificultad() == Dificultad.DIFICIL ) consultasXVeganos++ ]
					//} 
				//}	
			]	
		}		
				
				
				
			
			

	
	private new()
	{
		consultasXHora = new HashMap< Integer, Integer >
		recetasConsultadas = new HashMap< String, Integer >
		consultasXFemenino = new HashMap< String, Integer >
		consultasXMasculino = new HashMap< String, Integer >
		consultasXVeganos = 0
	}
	
	
	static def Consultoria getInstance()
	{
		if (instance == null)
		{
			instance = new Consultoria()
		}
		else
		{
			instance
		}
	}
	
	def void reset(){
		consultasXHora.clear()
		recetasConsultadas.clear()
		consultasXFemenino.clear()
		consultasXMasculino.clear()
		consultasXVeganos = 0
	}
	
	def Map< Integer , Integer> getConsultasXHora(){
		consultasXHora
	}
	
	def Map< String, Integer > getRecetasConsultadas(){
		recetasConsultadas
	}
	
	def Map< String, Integer > getConsultasFemenino(){
		consultasXFemenino
	}	
	
	def Map< String, Integer > getConsultasMasculino(){
		consultasXMasculino
	}
	
		def int getConsultasVegano(){
		consultasXVeganos
	}
	

}