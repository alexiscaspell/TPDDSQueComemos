package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.ResultadoConsulta;

@SuppressWarnings("all")
public interface Command {
  public abstract void execute(final ResultadoConsulta resultado);
}
