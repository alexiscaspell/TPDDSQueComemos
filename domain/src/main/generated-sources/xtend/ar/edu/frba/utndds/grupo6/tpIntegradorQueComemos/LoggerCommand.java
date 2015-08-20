package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Command;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ResultadoConsulta;
import org.apache.log4j.Logger;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@SuppressWarnings("all")
public class LoggerCommand implements Command {
  @Accessors
  private Logger logger;
  
  public void execute(final ResultadoConsulta resultado) {
    int _cantidadRecetas = resultado.getCantidadRecetas();
    boolean _greaterThan = (_cantidadRecetas > 100);
    if (_greaterThan) {
      this.logger.info("Consulta con mas de 100 resultados x el usuario ");
    }
  }
  
  @Pure
  public Logger getLogger() {
    return this.logger;
  }
  
  public void setLogger(final Logger logger) {
    this.logger = logger;
  }
}
