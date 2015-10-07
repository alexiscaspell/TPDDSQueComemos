package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import java.util.ArrayList
import java.util.Date
import java.util.List
import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors
import queComemos.entrega3.dominio.Dificultad
import org.uqbar.commons.utils.Observable
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condicion

@Observable
@Accessors
public class UsuarioPosta extends SujetoObservado implements Usuario, Consumidor {

	private Login login

	private double altura

	private double peso

	private Sexo sexo

	private Rutina rutina

	private String nombre

	private Date fechaNacimiento

	private String email

	private List<Condicion> condiciones = new ArrayList<Condicion>()

	private List<Ingrediente> preferenciasAlimenticias = new ArrayList<Ingrediente>()

	private List<String> platosQueNoLeGustan = new ArrayList<String>()

	private List<Receta> recetasBuscadasFavoritas = new ArrayList<Receta>()

	private List<Ingrediente> ingredientesFeos = new ArrayList<Ingrediente>()

	private List<Receta> recetas = new ArrayList<Receta>()

	private List<Receta> consultas = new ArrayList<Receta>()

	private List<Grupo> grupos = new ArrayList<Grupo>()

	private List<Receta> favoritas = new ArrayList<Receta>()

	new(double peso, double altura, Rutina rutina, String nombre, Sexo sexo, Date fechaNacimiento) {
		this.altura = altura
		this.peso = peso
		this.rutina = rutina
		this.fechaNacimiento = fechaNacimiento
		this.nombre = nombre
		this.sexo = sexo
	}

	new(double peso, double altura, Rutina rutina, String nombre, Sexo sexo) {
		this.altura = altura
		this.peso = peso
		this.rutina = rutina
		this.nombre = nombre
		this.sexo = sexo
	}

	// ------------------------------------------- Setters -------------------------------------------
	override void setNombre(String unNombre) {
		this.nombre = unNombre
	}

	def void setFechaNacimiento(Date unaFecha) {
		this.fechaNacimiento = unaFecha
	}

	def void setPeso(double peso) {
		this.peso = peso;
	}

	def void setAltura(double altura) {
		this.altura = altura;
	}

	def void setSexo(Sexo sexo) {
		this.sexo = sexo;
	}

	def void setPreferenciasAlimenticias(Map<Ingrediente, Integer> alimentos) {
		this.preferenciasAlimenticias = alimentos
	}

	def void setPlatosQueNoLeGustan(ArrayList<String> listaDeAlimentos) {
		this.platosQueNoLeGustan = listaDeAlimentos;
	}

	def void setRutina(Rutina rutina) {
		this.rutina = rutina
	}

	override void setLogin(Login login) {

		this.login = login
	}

	//	------------------------------------------- Getters -------------------------------------------
	override getLogin() {

		login
	}

	def getReceta(String nombre) {
		Recetario.getInstance().getReceta(nombre)
	}

	override getSexo() {
		sexo
	}

	override getFechaDeNacimiento() {
		fechaNacimiento
	}

	override getEmail() {
		email
	}

	override getNombre() {
		nombre
	}

	override getRecetas() {
		recetas
	}

	override getCondicion() {
		condiciones
	}

	override List<String> getPlatosQueNoLeGustan() {
		platosQueNoLeGustan
	}

	override getRecetasConAcceso() {

		val recetas = Recetario.getInstance().listarTodas();
		consultas.clear()

		recetas.forEach [ receta |
			if (receta.puedeVer(this)) {
				consultas.add(receta)
			}
		]
		println("ENTRO EN getRecetasConAcceso")
		notificar()
		return consultas
	}

	override getPeso() {
		peso
	}

	def getAltura() {
		altura
	}

	override getRutina() {
		rutina
	}

	override List<Ingrediente> getPreferenciasAlimenticias() {
		preferenciasAlimenticias
	}

	override double getIMC() {
		peso / (altura * altura)
	}

	override List<Receta> getConsultas() {
		consultas
	}

	override List<Receta> getRecetasBuscadasFavoritas() {
		recetasBuscadasFavoritas
	}

	//	------------------------------------------- Metodos -------------------------------------------
	override modificarReceta(String nombreRecetaAModificar, String nombreReceta, Map<Ingrediente, Integer> ingredientes,
		Map<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad, List<Temporada> temporada) {

		val receta = getReceta(nombreRecetaAModificar)

		if (receta.puedeModificar(this)) {
			if (receta.usuarioCreador.equals(this)) {
				receta.setNombre(nombreReceta)
				receta.setIngredientes(ingredientes)
				receta.setCondimentos(condimentos)
				receta.setExplicacion(explicacion)
				receta.setDificultad(dificultad)
				receta.setTemporadas(temporada)
			} else {
				val receta1 = receta.clone();
				receta1.setNombre(nombreReceta)
				receta1.setIngredientes(ingredientes)
				receta1.setCondimentos(condimentos)
				receta1.setExplicacion(explicacion)
				receta1.setDificultad(dificultad)
				receta1.setTemporadas(temporada)
				receta1.setUsuarioCreador(this)
				recetas.add(receta1)
			}
		}
	}

	def agregarReceta(Receta receta) {
		recetas.add(receta)
		Recetario.getInstance().agregar(receta)
	}

	override comparteGrupo(Usuario usuario) {
		grupos.exists[x|x.contieneAlUsuario(usuario)]
	}

	override puedeComer(Receta receta) {
		true
	}

	public def boolean tieneIngredientesFeos(Map<Ingrediente, Integer> ingredientes) {
		ingredientesFeos.exists[ingredienteFeo|ingredientes.keySet.contains(ingredienteFeo)]
	}

	override sePuedeSugerir(Receta receta) {
		!tieneIngredientesFeos(receta.getIngredientes())
	}

	override void marcarComoFavorita(Receta receta) {
		if (receta.puedeVer(this)) {
			favoritas.add(receta)
		}
	}

	override agregarGrupo(Grupo grupo) {
		grupos.add(grupo)
	}

	def boolean cumpleCamposObligatorios() {
		return (nombre != null && peso > 0 && altura > 0 && fechaNacimiento != null && rutina != null);
	}

	def boolean fechaNacimientoValida() {
		return (fechaNacimiento.before(new Date()))
	}

	def boolean nombreCorrecto() {
		return (nombre.length > 4);
	}

	override estadoRutina() {
		return ( this.getIMC > 18 && this.getIMC < 30 )
	}

	override usuarioValido() {
		return (cumpleCamposObligatorios() && nombreCorrecto())
	}

	override cumpleMismasCondiciones(Usuario usuario) {

		true
	}

	override crearPerfil() {

		val UsuarioPosta usuarioCopia = new UsuarioPosta(peso, altura, rutina, nombre, sexo, fechaNacimiento)

		return usuarioCopia

	}

	// ------------------------------------------------ Metodos Observer y Alternativa------------------------------------------------
	override notificar() {
		getObservadores().forEach[actualizar(this)]
	}

	override esVegano() {
		return false;
	}

	override esHipertenso() {
		return false;
	}

	override esDiabetico() {
		return false;
	}
}
