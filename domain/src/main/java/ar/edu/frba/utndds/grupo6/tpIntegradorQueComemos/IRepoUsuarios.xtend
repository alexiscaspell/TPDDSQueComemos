package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.List

public interface IRepoUsuarios {

	def void add(Usuario usuario)

	def void remove(Usuario usuario)

	def void update(Usuario usuario)

	def Usuario get(Usuario usuario)

	def List<Usuario> list(Usuario usuario)

}
