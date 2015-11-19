package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.TipoReceta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Excepciones.RecetaInvalidaExc
import com.fasterxml.jackson.annotation.JsonProperty
import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import queComemos.entrega3.dominio.Dificultad

@Observable
@Accessors
public class Receta implements Cloneable, IReceta {
	
	private String id;

	@JsonProperty("_id")
	def String getId() {
		return id;
	}

	@JsonProperty("_id")
	def void setId(String id) {
		this.id = id;
	}
	
	private String usuarioCreador

	private String nombre

	private int anio

	private int tiempoPreparacion

	private Dificultad dificultad

	private Set<Temporada> temporadas

	private TipoReceta tipo

	private Map<Ingrediente, Integer> ingredientes = new HashMap<Ingrediente, Integer>()

	private Map<Condimento, Integer> condimentos = new HashMap<Condimento, Integer>()

	private int calorias

	private String explicacion

	private List<IReceta> subRecetas;

	new(
		String usuario,
		String nombre,
		Map<Ingrediente, Integer> ingredientes,
		Map<Condimento, Integer> condimentos,
		String explicacion,
		Dificultad dificultad,
		Set<Temporada> temporadas
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
		usuarioCreador.equals(usuario.nombre) || tipo.esPublica()
	}

	private def int cantidadDeAzucarEnLosCondimentos() {
		condimentos.keySet.fold(0, [acum, condimento|acum + condimento.cantidadDeAzucar(condimentos.get(condimento))])
	}

	override agregarSubReceta(IReceta receta) {
		this.subRecetas.add(receta)
	}

	def boolean puedeVer(Usuario usuario) {
		usuarioCreador == null || usuarioCreador.equals(usuario.getNombre()) || tipo.esPublica() ||
			RepoUsuarios.getInstance.get( usuarioCreador ).comparteGrupo(usuario)
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
