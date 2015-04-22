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

	private ArrayList<Ingrediente> preferenciasAlimenticias; 

	private ArrayList<String> platosQueNoLeGustan = new ArrayList<String>();

	private ArrayList<Receta> recetas = new ArrayList<Receta>;
		
	private Recetario recetario
	
	Receta recetaAux
	
	new(double peso, double altura, Rutinas rutina, String nombre,Sexo sexo, Date fechaNacimiento) 
	{
		this.altura = altura
		this.peso = peso
		this.rutina = rutina
		this.fechaNacimiento=fechaNacimiento
		this.nombre=nombre
		this.sexo=sexo
		preferenciasAlimenticias = new ArrayList<Ingrediente>();
		recetario = Recetario.getInstance()
	}

	override boolean cumpleCamposObligatorios() 
	{
		return (nombre != null && peso > 0 && altura > 0 && fechaNacimiento != null && rutina != null);
	}

	override boolean fechaNacimientoValida() 
	{
		return (fechaNacimiento.before(hoy))
	}

	override boolean nombreCorrecto()
	{
		return (nombre.length > 4);
	}

	override double calcularIMC()
	{
		peso / (altura * altura)
	}

	override estadoRutina() 
	{
		if (this.calcularIMC < 18 || this.calcularIMC > 30) {
			throw new RutinaNoSaludableExc()
		}
	}

	//Getters
	
	override getRecetario()
	{
		recetario
	}
	
	override getPeso() {
		peso
	}

	override getAltura() {
		altura
	}

	override getRutina() {
		rutina
	}

	override ArrayList<Ingrediente> getPreferenciasAlimenticias() {
		preferenciasAlimenticias
	}
	
	override getSexo(){
		sexo
	}

	override usuarioValido() {
		return ( cumpleCamposObligatorios() && nombreCorrecto()) // && fechaNacimientoValida())
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

	override setPreferenciasAlimenticias(Ingrediente alimento) {
		this.preferenciasAlimenticias.add(alimento)
	}

	override setPlatosQueNoLeGustan(ArrayList<String> listaDeAlimentos) {
		this.platosQueNoLeGustan = listaDeAlimentos;
	}

	override setRutina(Rutinas rutina) {
		this.rutina = rutina
	}
	
	override modificarReceta() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getReceta( String nombre ){
		recetario.getReceta( nombre )
	}
	
	override agregarReceta(Receta receta) 
	{
		recetas.add(receta)
	}
	
}
