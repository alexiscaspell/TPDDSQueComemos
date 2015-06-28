package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

public class SendMailCommand implements Command 
{
	private MailSender mailSender;
	
	new (MailSender mailSender)
	{
		this.mailSender = mailSender;
	}
	
	override execute(ResultadoConsulta resultado) 
	{
		this.mailSender.enviar(resultado.usuario.getEmail, CrearMensaje(resultado.getRecetaModelo()))		
	}
	
	def String CrearMensaje(Receta receta) 
	{
		val stringBuilder = new StringBuilder();
		
		stringBuilder.append("Parámetros de la Consulta:");
		
		if (receta.getNombre() != null)
		{
			stringBuilder.append(receta.getNombre())
		}
		
		if (receta.getAnio() != 0)
		{
			stringBuilder.append(receta.getAnio())
		}
		
		if (receta.getDificultad() != null)
		{
			stringBuilder.append(receta.getDificultad());
		}
		
		if (receta.getExplicacion() != null)
		{
			stringBuilder.append(receta.getExplicacion());
		}
		
		return stringBuilder.toString();
	}	
}