package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import java.util.Date
import java.util.ArrayList
import java.util.Map
import java.util.List
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Dificultad
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada

public class UsuarioPosta implements Usuario, Consumidor  {

	private double altura

	private double peso
	
	private Sexo sexo

	private Rutina rutina

	private String nombre

	private Date fechaNacimiento

	private List<Ingrediente> preferenciasAlimenticias = new ArrayList<Ingrediente>()

	private List<String> platosQueNoLeGustan = new ArrayList<String>()
	
	private ArrayList<Observador> Observadores = new ArrayList<Observador>()
	
	@Accessors
	private List<Ingrediente> ingredientesFeos = new ArrayList<Ingrediente>()

	private List<Receta> recetas = new ArrayList<Receta>()
	
	private List<Receta> Consultas = new ArrayList<Receta>()
	
	private List<Grupo> grupos = new ArrayList<Grupo>()
	
	private List<Receta> favoritas = new ArrayList<Receta>()
		
	private RepositorioRecetas recetario		
	
	new(double peso, double altura, Rutina rutina, String nombre,Sexo sexo, Date fechaNacimiento) 
	{
		this.altura = altura
		this.peso = peso
		this.rutina = rutina
		this.fechaNacimiento=fechaNacimiento
		this.nombre=nombre
		this.sexo=sexo
		recetario = RepositorioRecetas.getInstance()
	}	

// ------------------------------------------- Setters -------------------------------------------
	def void setNombre(String unNombre) 
	{
		this.nombre = unNombre
	}

	def void setFechaNacimiento(Date unaFecha) 
	{
		this.fechaNacimiento = unaFecha
	}

	def void setPeso(double peso) 
	{
		this.peso = peso;
	}

	def void setAltura(double altura) 
	{
		this.altura = altura;
	}
	
	def void setSexo(Sexo sexo)
	{
		this.sexo=sexo;
	}

	def void setPreferenciasAlimenticias(Map<Ingrediente, Integer> alimentos) 
	{
		this.preferenciasAlimenticias = alimentos
	}

	def void setPlatosQueNoLeGustan(ArrayList<String> listaDeAlimentos) 
	{
		this.platosQueNoLeGustan = listaDeAlimentos;
	}

	def void setRutina(Rutina rutina) 
	{
		this.rutina = rutina
	}
		
	
//	------------------------------------------- Getters -------------------------------------------
	override getReceta(String nombre){
		recetario.getReceta(nombre)
	}
	
	override getSexo() {
		sexo
	}
	
	override getRecetas(){
		recetas
	}
	
	override List<String> getPlatosQueNoLeGustan(){
		platosQueNoLeGustan
	}
	
	override getRecetasConAcceso(List<Receta> recetas) 
	{
		Consultas.clear()
		
		recetas.forEach[receta |
			if (receta.puedeVer(this))
			{
				Consultas.add(receta)
			}
		]
		
		Observadores.forEach[ actualizar( this ) ]
		return Consultas
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

	override List<Ingrediente> getPreferenciasAlimenticias() {
		preferenciasAlimenticias
	}
	
	def double getIMC()
	{
		peso / (altura * altura)
	}
	
	override List<Receta> getConsultas()
	{
		Consultas	
	}
	
//	------------------------------------------- Metodos -------------------------------------------
	override modificarReceta(String nombreReceta, String nuevo_nombre, Map<Ingrediente, Integer> ingredientes,
		Map<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad,
		ArrayList<Temporada> temporada) 
	{
					
		val receta = getReceta(nombreReceta) 
		receta.setNombre(nombre) 
		receta.setIngredientes(ingredientes)
		receta.setCondimentos(condimentos) 
		receta.setExplicacion(explicacion) 
		receta.setDificultad(dificultad) 
		receta.setTemporadas(temporada) 
	}
	
	override agregarReceta(Receta receta) 
	{
		recetas.add(receta)
	}
	
	override comparteGrupo(Usuario usuario) {
		grupos.exists[x | x.contieneAlUsuario(usuario)]
	}
	
	override puedeComer(Receta receta) {
		true
	}
	
	public def boolean tieneIngredientesFeos(Map<Ingrediente, Integer> ingredientes){
		ingredientesFeos.forall[ingredienteFeo | ingredientes.keySet.contains(ingredienteFeo)]
	}
		
	override sePuedeSugerir(Receta receta) {		
		!tieneIngredientesFeos(receta.getIngredientes())
	}
	
	override marcarComoFavorita(Receta receta) {
		if (receta.puedeVer(this))
		{
			favoritas.add(receta)			
		}
	}
		
	override agregarGrupo(Grupo grupo){
		grupos.add(grupo)
	}
	
	def boolean cumpleCamposObligatorios() 
	{
		return (nombre != null && peso > 0 && altura > 0 && fechaNacimiento != null && rutina != null);
	}

	def boolean fechaNacimientoValida() 
	{
		return (fechaNacimiento.before(new Date()))
	}

	def boolean nombreCorrecto()
	{
		return (nombre.length > 4);
	}

	override estadoRutina() 
	{
		return ( this.getIMC > 18 && this.getIMC < 30 ) 
	}
	
	override usuarioValido() 
	{
		return (cumpleCamposObligatorios() && nombreCorrecto())
	}
// ------------------------------------------------ Metodos Observer ------------------------------------------------
	
	override addObservador( Observador observador )
 	{
		Observadores.add( observador )
	}
	 
	override removeObservador( Observador observador )
	{
		Observadores.remove( observador )
	}
	 
	override notificar()
	{
		Observadores.forEach[ actualizar( this )]
	}
	
 
	
}