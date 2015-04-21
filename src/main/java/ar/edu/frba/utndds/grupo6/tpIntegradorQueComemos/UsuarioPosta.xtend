package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.Date
import java.util.ArrayList
import java.util.HashMap

public class UsuarioPosta implements Usuario {

	private double altura;

	private double peso;
	
	private Sexo sexo;

	private Rutinas rutina;

	private String nombre;

	private Date fechaNacimiento;

	private Date hoy = new Date();

	private ArrayList<String> preferenciasAlimenticias = new ArrayList<String>();

	private ArrayList<String> platosQueNoLeGustan = new ArrayList<String>();

	private ArrayList<Receta> recetas;
	
	private Recetario recetario
	
	Receta recetaAux
	
	new(double peso, double altura, Rutinas rutina, String nombre,Sexo sexo, Date fechaNacimiento, Rutinas rutinaUsuario ) {

		this.altura = altura
		this.peso = peso
		this.rutina = rutinaUsuario
		this.preferenciasAlimenticias.add("")
		this.fechaNacimiento=fechaNacimiento
		this.nombre=nombre
		this.sexo=sexo
				

	}

	override boolean usuarioValido() {
		return (cumpleCamposObligatorios() && nombreCorrecto() && cumpleCondicion() && fechaNacimientoValida())
	}

	override boolean cumpleCamposObligatorios() {
		return (nombre != null && peso > 0 && altura > 0 && fechaNacimiento != null && rutina != null);
	}

	override boolean fechaNacimientoValida() {

		return (fechaNacimiento.before(hoy))
	}

	override boolean nombreCorrecto() {
		return (nombre.length > 4);
	}

	
	override double calcularIMC() {
		peso / (altura * altura)
	}

	override estadoRutina() {
		if (this.calcularIMC < 18 || this.calcularIMC > 30) {
			throw new RutinaNoSaludableExc()
		}
	}

	//Getters
	override getPeso() {
		peso
	}

	override getAltura() {
		altura
	}

	override getRutina() {
		rutina
	}

	override ArrayList<String> getPreferenciasAlimenticias() {
		preferenciasAlimenticias
	}

	override cumpleCondicion() {
		return true
	}

	//Setters
	override setNombre(String unNombre) {

		this.nombre = unNombre
	}

	override setFechaNacimiento(Date unaFecha) {

		this.fechaNacimiento = unaFecha
	}

	override setPeso(double peso) {
		this.peso = peso;
	}

	override setAltura(double altura) {
		this.altura = altura;
	}
	
	override setSexo(Sexo sexo){
		this.sexo=sexo;
	}

	override setPreferenciasAlimenticias(ArrayList<String> listaDeAlimentos) {
		this.preferenciasAlimenticias = listaDeAlimentos;
	}

	override setPlatosQueNoLeGustan(ArrayList<String> listaDeAlimentos) {
		this.platosQueNoLeGustan = listaDeAlimentos;
	}

	override setRutina(Rutinas rutina) {
		this.rutina = rutina
	}
	
	override agregarRecetaSimple(String nombre, HashMap<Ingrediente, Integer> ingredientes,
		HashMap<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad,
		ArrayList<Temporada> temporada) {

		val recetaSimple = new RecetaSimple(this, nombre, ingredientes, condimentos, explicacion, dificultad, temporada)

		// Setear tipo de receta privada
		recetas.add(recetaSimple)
	}
	
	override agregarRecetaCompuesta( String composicion1, String compsicion2 ) {
		
		val recetasSimples = new ArrayList<Receta>()
		recetasSimples.add(getReceta( composicion1 ))
		recetasSimples.add(getReceta( compsicion2 ))	
		val recetaCompuesta = new RecetaCompuesta( recetasSimples )
		recetas.add( recetaCompuesta )
	}
	
	override modificarReceta() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getReceta( String nombre ){
		
		for (i : 0 ..< recetas.length) {
			val receta = recetas.get(i)
			if(receta.nombre == nombre) return receta
		}
		// Agregar situacion donde la receta obtenida es una compuesta
		recetaAux = recetario.getReceta( nombre ) 
		agregarRecetaSimple( nombre, recetaAux.ingredientes, recetaAux.condimentos, recetaAux.explicacion, recetaAux.dificultad, recetaAux.temporada )
		getReceta( nombre )
		// Revizar recursividad 
	}
	
}
