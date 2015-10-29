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
import javax.persistence.Entity
import javax.persistence.Column
import javax.persistence.Enumerated
import javax.persistence.EnumType
import javax.persistence.OneToMany
import javax.persistence.FetchType
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.RecetasRepository
import javax.persistence.GeneratedValue
import javax.persistence.Id
import org.hibernate.annotations.CollectionOfElements
import javax.persistence.ManyToMany
import javax.persistence.OneToOne
import org.hibernate.annotations.LazyCollection
import org.hibernate.annotations.LazyCollectionOption
import javax.persistence.CascadeType
import org.hibernate.annotations.Fetch
import org.hibernate.annotations.FetchMode
import java.util.HashSet
import java.util.Set
import javax.persistence.JoinColumn
import javax.persistence.JoinTable

@Entity
@Observable
@Accessors
public class UsuarioPosta extends Usuario implements Consumidor {

	/*
	@Id
	@GeneratedValue
	private long id
	*/

	@OneToOne 
	private Login login
	
	@Column ( length = 150 )
	private String nickName
	
	@Column ( length = 150 )
	private String password

	@Column
	private double altura

	@Column		
	private double peso

	@Enumerated(EnumType.STRING) 
	private Sexo sexo

	@Enumerated(EnumType.STRING)
	private Rutina rutina

	@Column ( length = 150 )
	private String nombre

	// Buscar como guardar fehcas
	private Date fechaNacimiento

	@Column ( length = 150 )
	private String email

	// Buscar como persistir lista de enums
	@CollectionOfElements ( fetch = FetchType.EAGER )
	@Fetch(value = FetchMode.SUBSELECT)
	private List<Condicion> condiciones = new ArrayList<Condicion>()

	@CollectionOfElements ( fetch = FetchType.EAGER )
	@Fetch(value = FetchMode.SUBSELECT)
	private List<Ingrediente> preferenciasAlimenticias = new ArrayList<Ingrediente>()

	@CollectionOfElements ( fetch = FetchType.EAGER )
	@Fetch(value = FetchMode.SUBSELECT)
	private List<String> platosQueNoLeGustan = new ArrayList<String>()

	//@LazyCollection (LazyCollectionOption.FALSE)
	/*
	@OneToMany ( fetch = FetchType.EAGER )// Verificar si es EAGER o LAZY
	@Fetch(value = FetchMode.SUBSELECT)
	private List<Receta> recetasBuscadasFavoritas = new ArrayList<Receta>()
	 */
	

	@CollectionOfElements (fetch=FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<Ingrediente> ingredientesFeos = new ArrayList<Ingrediente>()

	//@LazyCollection (LazyCollectionOption.FALSE)
	@OneToMany ( fetch = FetchType.EAGER, cascade = CascadeType.ALL ) // Verificar si es EAGER o LAZY
	@Fetch(value = FetchMode.SUBSELECT)
	private List<Receta> recetas = new ArrayList<Receta>()

	// @LazyCollection (LazyCollectionOption.FALSE)
	@OneToMany  ( fetch = FetchType.EAGER )// Verificar si es EAGER o LAZY
	@Fetch(value = FetchMode.SUBSELECT)
	@JoinTable(
            name="Consultas",
            joinColumns = @JoinColumn( name="User_id"),
            inverseJoinColumns = @JoinColumn( name="Receta_id")
    )
    
	private List<Receta> consultas = new ArrayList<Receta>()

	//@LazyCollection (LazyCollectionOption.FALSE)
	@ManyToMany ( fetch = FetchType.EAGER )
	@Fetch(value = FetchMode.SUBSELECT) 
	private List<Grupo> grupos = new ArrayList<Grupo>()

	//@LazyCollection (LazyCollectionOption.FALSE)
	//@OneToMany ( fetch = FetchType.EAGER, cascade = CascadeType.ALL ) // Verificar si es EAGER o LAZY
	//@Fetch ( value = FetchMode.SUBSELECT )
	@OneToMany ( fetch = FetchType.EAGER, cascade = CascadeType.ALL )
   	@JoinTable(
            name="Usuario_Favoritas",
            joinColumns = @JoinColumn( name="User_id"),
            inverseJoinColumns = @JoinColumn( name="Receta_id")
    )
    
	private Set<Receta> favoritas = new HashSet<Receta>()

	new(double peso, double altura, Rutina rutina, String nombre, Sexo sexo, Date fechaNacimiento) {
		this.altura = altura
		this.peso = peso
		this.rutina = rutina
		this.fechaNacimiento = fechaNacimiento
		this.nombre = nombre
		this.sexo = sexo
	}
	
	
	new(){
	}
	/*
	new(double peso, double altura, Rutina rutina, String nombre, Sexo sexo) {
		this.altura = altura
		this.peso = peso
		this.rutina = rutina
		this.nombre = nombre
		this.sexo = sexo
	} */

	// ------------------------------------------- Setters -------------------------------------------
	
	override setNickName(String nickName){
		
		this.nickName = nickName
	}
	
	override  setPassword(String password){
		
		this.password = password
	}
	
	
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
	
	override String getNickName(){
		
		nickName
	}
	
	override String getPassword(){
		
		password
	}
	
	override getLogin() {

		login
	}

	def getReceta(String nombre) {
		RecetasRepository.getInstance().searchByName(nombre).head
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
		
		val recetas = RecetasRepository.getInstance().allInstances();
		val listaRecetasConAcceso = new ArrayList<Receta>

		recetas.forEach [ receta |
			if (receta.puedeVer(this)) {
				listaRecetasConAcceso.add(receta)
			}
		]
		
		return listaRecetasConAcceso
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
	/*
	override List<Receta> getRecetasBuscadasFavoritas() {
		recetasBuscadasFavoritas
	}
 */
	//	------------------------------------------- Metodos -------------------------------------------
	override modificarReceta(String nombreRecetaAModificar, String nombreReceta, Map<Ingrediente, Integer> ingredientes,
		Map<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad, Set<Temporada> temporada) {

		val receta = getReceta(nombreRecetaAModificar)

		if ( receta.puedeModificar(this) ) {
			println( "Puede modificarla")
			if ( receta.usuarioCreador.equals(this.nombre)) {
				receta.setNombre(nombreReceta)
				receta.setIngredientes(ingredientes)
				receta.setCondimentos(condimentos)
				receta.setExplicacion(explicacion)
				receta.setDificultad(dificultad)
				receta.setTemporadas(temporada)
				RecetasRepository.getInstance.update( receta )
			} else {
				val receta1 = receta.clone();
				receta1.setNombre(nombreReceta)
				receta1.setIngredientes(ingredientes)
				receta1.setCondimentos(condimentos)
				receta1.setExplicacion(explicacion)
				receta1.setDificultad(dificultad)
				receta1.setTemporadas(temporada)
				receta1.setUsuarioCreador(this.nombre)
				recetas.add(receta1)
			}
		}
	}

	def agregarReceta(Receta receta) {
		recetas.add(receta)
		RecetasRepository.getInstance().create(receta)
	}

	override comparteGrupo(Usuario usuario) {
		grupos.exists[x|x.contieneAlUsuario(usuario)]
	}
	
	override consultarPorReceta( Receta receta ){
		
		consultas.clear()
		if ( receta.puedeVer( this )) consultas.add( receta )
		notificar()
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
	
	override boolean cumpleCondicion(Receta receta){
		
		true
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
