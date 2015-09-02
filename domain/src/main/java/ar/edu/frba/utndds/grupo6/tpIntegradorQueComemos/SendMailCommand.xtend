package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

public class SendMailCommand implements Command {
	private MailSender mailSender;

	new(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	override execute(ResultadoConsulta resultado) {
		this.mailSender.enviar(resultado.usuario.getEmail, CrearMensaje(resultado.getRecetaModelo()))
	}

	def String CrearMensaje(Receta receta) {
		val stringBuilder = new StringBuilder();

		stringBuilder.append("Parámetros de la Consulta:");

		if (receta.getNombre() != null) {
			stringBuilder.append("Nombre: " + receta.getNombre())
		}

		if (receta.getAnio() != 0) {
			stringBuilder.append("Anio: " + receta.getAnio())
		}

		if (receta.getDificultad() != null) {
			stringBuilder.append("Anio: " + receta.getDificultad());
		}

		if (receta.getExplicacion() != null) {
			stringBuilder.append("Explicacion: " + receta.getExplicacion());
		}

		return stringBuilder.toString();
	}
}
