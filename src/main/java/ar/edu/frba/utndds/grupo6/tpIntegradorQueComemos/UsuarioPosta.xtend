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

public class UsuarioPosta extends SujetoObservado implements Usuario, Consumidor {

	private double altura

	private double peso

	private Sexo sexo

	private Rutina rutina

	private String nombre

	private Date fechaNacimiento
	
	//private List<Condicion> condiciones = new ArrayList<Condicion>()

	private List<Ingrediente> preferenciasAlimenticias = new ArrayList<Ingrediente>()

	private List<String> platosQueNoLeGustan = new ArrayList<String>()	

	@Accessors
	private List<Ingrediente> ingredientesFeos = new ArrayList<Ingrediente>()

	private List<Receta> recetas = new ArrayList<Receta>()

	private List<Receta> consultas = new ArrayList<Receta>()

	private List<Grupo> grupos = new ArrayList<Grupo>()

	private List<Receta> favoritas = new ArrayList<Receta>()

	private Recetario recetario

	new(double peso, double altura, Rutina rutina, String nombre, Sexo sexo, Date fechaNacimiento) {
		this.altura = altura
		this.peso = peso
		this.rutina = rutina
		this.fechaNacimiento = fechaNacimiento
		this.nombre = nombre
		this.sexo = sexo
		recetario = Recetario.getInstance()
	}

	// ------------------------------------------- Setters -------------------------------------------
	def void setNombre(String unNombre) {
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

	//	------------------------------------------- Getters -------------------------------------------
	def getReceta(String nombre) {
		recetario.getReceta(nombre)
	}

	override getSexo() {
		sexo
	}

	override getNombre() {
		nombre
	}

	override getRecetas() {
		recetas
	}

	override List<String> getPlatosQueNoLeGustan() {
		platosQueNoLeGustan
	}

	override getRecetasConAcceso() {
		val recetario = Recetario.getInstance();
		val recetas = recetario.listarTodas();
		consultas.clear()

		recetas.forEach [ receta |
			if (receta.puedeVer(this)) {
				consultas.add(receta)
			}
		]

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
	
	//override getCondicion() {
		//condiciones
	//}

	override List<Ingrediente> getPreferenciasAlimenticias() {
		preferenciasAlimenticias
	}

	def double getIMC() {
		peso / (altura * altura)
	}

	override List<Receta> getConsultas() {
		consultas
	}

	//	------------------------------------------- Metodos -------------------------------------------
	def modificarReceta(String nombreRecetaAModificar, String nombreReceta, 
		Map<Ingrediente, Integer> ingredientes,
		Map<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad,
		List<Temporada> temporada) {

		val receta = getReceta(nombreRecetaAModificar)
		
		if (receta.puedeModificar(this))
		{
			if (receta.usuarioCreador.equals(this))
			{
				receta.setNombre(nombreReceta)
				receta.setIngredientes(ingredientes)
				receta.setCondimentos(condimentos)
				receta.setExplicacion(explicacion)
				receta.setDificultad(dificultad)
				receta.setTemporadas(temporada)
			}
			else
			{
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

	def marcarComoFavorita(Receta receta) {
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
	
	
	
	// ------------------------------------------------ Metodos Observer y Alternativa------------------------------------------------
	
	override notificar(){
		getObservadores().forEach[ actualizar( this ) ]
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
