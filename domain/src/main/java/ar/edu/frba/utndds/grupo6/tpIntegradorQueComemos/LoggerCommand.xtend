package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.apache.log4j.Logger
import org.eclipse.xtend.lib.annotations.Accessors

class LoggerCommand implements Command {

	@Accessors
	private Logger logger;

	override execute(ResultadoConsulta resultado) {
		if (resultado.cantidadRecetas > 100) {
			logger.info("Consulta con mas de 100 resultados x el usuario ")
		}
	}

}
