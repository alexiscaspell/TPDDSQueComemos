package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Map
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion
import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Excepciones.RecetaInvalidaExc
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.TipoReceta
import queComemos.entrega3.dominio.Dificultad
import org.uqbar.commons.utils.Observable
import java.util.HashMap

@Observable
@Accessors
public class Receta implements IReceta, Cloneable {

	private Usuario usuarioCreador

	private String nombre

	private int anio

	private int tiempoPreparacion

	private Dificultad dificultad

	private List<Temporada> temporadas

	private TipoReceta tipo

	private Map<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>()

	private Map<Condimento, Integer> condimentos

	private int calorias

	private String explicacion

	private List<IReceta> subRecetas;

	new(
		Usuario usuario,
		String nombre,
		Map<Ingrediente, Integer> ingredientes,
		Map<Condimento, Integer> condimentos,
		String explicacion,
		Dificultad dificultad,
		List<Temporada> temporadas
	) {
		this.usuarioCreador = usuario
		this.nombre = nombre
		this.ingredientes = ingredientes
		this.condimentos = condimentos
		this.explicacion = explicacion
		this.dificultad = dificultad
		this.temporadas = temporadas
		this.subRecetas = new ArrayList<IReceta>()
	}

	new() {
		this.subRecetas = new ArrayList<IReceta>()
	}

	override validar() {
		if (ingredientes.values.length == 0 || getCalorias() < 5 || getCalorias() > 5000) {
			throw new RecetaInvalidaExc()
		}

		subRecetas.forEach[e|e.validar()]
	}

	override condicionesInadecuadas() {
		val condicionesInadecuadas = new ArrayList<Condicion>()

		if (condimentos.containsKey(Condimento.SAL) || condimentos.containsKey(Condimento.CALDO)) {
			condicionesInadecuadas.add(Condicion.HIPERTENSO)
		}

		if (cantidadDeAzucar() > 100) {
			condicionesInadecuadas.add(Condicion.DIABETICO)
		}

		if (ingredientes.keySet.exists[x|x.contieneCarne()]) {
			condicionesInadecuadas.add(Condicion.VEGANO)
		}

		subRecetas.forEach[x|condicionesInadecuadas.addAll((x.condicionesInadecuadas()))]

		return condicionesInadecuadas
	}

	override cantidadDeAzucar() {
		val recetasConAzucar = subRecetas.filter[x|x.condimentos.containsKey(Condimento.AZUCAR)]
		recetasConAzucar.fold(cantidadDeAzucarEnLosCondimentos(), [acum, receta|acum + receta.cantidadDeAzucar()])
	}

	override getIngredientes() {
		for (i : 0 ..< subRecetas.size) {
			val receta = subRecetas.get(i)
			ingredientes.putAll(receta.getIngredientes())
		}
		ingredientes
	}

	override getCondimentos() {
		for (i : 0 ..< subRecetas.size) {
			val receta = subRecetas.get(i)
			condimentos.putAll(receta.getCondimentos())
		}
		condimentos
	}
	
	def agregarCondimento(Condimento condimento, Integer valor)
	{
		this.condimentos.put(condimento, valor);
	}
	
	def agregarIngrediente(Ingrediente ingrediente, Integer valor)
	{
		this.ingredientes.put(ingrediente, valor);
	}

	override getExplicacion() {

		val explicacion = ""

		subRecetas.forEach[receta|String.join(explicacion, receta.getExplicacion())]

		String.join(explicacion, this.explicacion)
	}

	override getCalorias() {
		subRecetas.fold(this.calorias, [acum, receta|acum + receta.calorias])
	}

	def boolean puedeModificar(Usuario usuario) {
		usuarioCreador.equals(usuario) || tipo.esPublica()
	}

	private def int cantidadDeAzucarEnLosCondimentos() {
		condimentos.keySet.fold(0, [acum, condimento|acum + condimento.cantidadDeAzucar(condimentos.get(condimento))])
	}

	override agregarSubReceta(IReceta receta) {
		this.subRecetas.add(receta)
	}

	def boolean puedeVer(Usuario usuario) {
		usuarioCreador == null || usuarioCreador.getNombre().equals(usuario.getNombre()) || tipo.esPublica() ||
			usuarioCreador.comparteGrupo(usuario)
	}

	def boolean esIgual(Receta receta) {

		return (nombre == receta.nombre)
	}

	def boolean estaContenido(List<Receta> recetas) {

		return (recetas.exists[receta|esIgual(receta)])
	}

	def void setPublica() {
		tipo = TipoReceta.PUBLICA
	}

	def boolean esPublica() {
		tipo.esPublica()
	}

	override Receta clone() {
		val nueva = new Receta();
		nueva.nombre = nombre;
		nueva.ingredientes = ingredientes;
		nueva.condimentos = condimentos;
		nueva.anio = anio;
		nueva.usuarioCreador = usuarioCreador;
		nueva.explicacion = explicacion;
		nueva.dificultad = dificultad;
		nueva.temporadas = temporadas;
		nueva.subRecetas = subRecetas;
		nueva;
	}
}
