package FiltrosConsultasRecetas
import org.junit.Test
import org.junit.Assert
import java.util.HashMap
import java.util.ArrayList
import java.util.Date
import java.text.DateFormat
import java.text.SimpleDateFormat
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import java.util.List
import queComemos.entrega3.dominio.Dificultad
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioVegano
import Pedidos.PedidoFiltroConsultaReceta
import java.util.HashSet

class FiltrosTestSuite {
	
	/*----------------VARIABLES------------------*/
	DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
	Date fecha = format.parse("01-04-1970")
	/*---------------FIN VARIABLES---------------*/
	
	
	/*-----------------USUARIOS-----------------*/
	Usuario hipertenso
	Usuario vegano
	
	private val pepe = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
	private val carlos = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
	private val raul = new UsuarioPosta(80.4,1.90,Rutina.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
	/*---------------FIN USUARIOS---------------*/
	
		
	/*---------------RECETAS---------------*/
	public def Receta pureConAzucarYSinSal()
	{	
		val usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE,"Juan Carlos Lopez",Sexo.MASCULINO,fecha)
		val nombre = "Pure"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.PAPA, 1000)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.ACEITE, 10)
		condimentos.put(Condimento.AZUCAR, 100)
		val explicacion = "1 - Pelar las papas\n" + 
						  "2 - Hervir las papas 20 minutos" +
						  "3 - Pisar las papas con un pisapapas" +
						  "4 - Condimentar"
		val temporadas = new  HashSet<Temporada>()		
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)						  
		val recetaSimple = new Receta(usuario.nombre, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple
	}

	public def Receta getRecetaMilanesas()
	{
		val usuario = new UsuarioPosta(100, 1.50, Rutina.LEVE,"Juan Carlos Lopez",Sexo.MASCULINO,fecha)
		val nombre = "Milanesas"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.CARNE, 1000)
		ingredientes.put(Ingrediente.HUEVO, 6)
		ingredientes.put(Ingrediente.PAN_RAYADO, 6)
		val condimentos = new HashMap<Condimento, Integer>()
		//condimentos.put(Condimento.SAL, 10)
		condimentos.put(Condimento.ACEITE, 10)		
		val explicacion = "1 - Cortar la carne\n" + 
						  "2 - Pasar la carne por el huevo" +
						  "3 - Pasar la carne por pan rayado" +
						  "4 - Hornear 25 minutos"
		val temporadas = new HashSet<Temporada>()		
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)						  
		val recetaSimple = new Receta(usuario.nombre, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple
	}
	/*---------------FIN RECETAS---------------*/
	
	@Test
	def void filtrarRecetasPorNombre(){
	
	var List<Receta> recetas = new ArrayList<Receta>
	
	recetas.add(recetaMilanesas)
	
	recetas.add(pureConAzucarYSinSal)
	
	var Filtrador filtrador = new Filtrador()
	
	var PedidoFiltroConsultaReceta pedidoFiltroMilanga = new PedidoFiltroConsultaReceta()
	
	pedidoFiltroMilanga.nombre = "Milanesas"
	
	//pedidoFiltroMilanga.filtrosUsuario = false
	
	filtrador.crearFiltros(pedidoFiltroMilanga)
	
	var List<Receta> recetasFiltradas = filtrador.filtrar(recetas)	
	
	Assert.assertTrue(recetasFiltradas.head.nombre.equals("Milanesas")&&recetasFiltradas.size.equals(1))
	
}

	@Test
	def void filtraPorFiltroUsuario(){
	
	var List<Receta> recetas = new ArrayList<Receta>
	
	recetas.add(recetaMilanesas)
	
	recetas.add(pureConAzucarYSinSal)
	
	var Filtrador filtrador = new Filtrador()
	
	vegano = new UsuarioVegano(pepe)
	
	filtrador.usuario = vegano
	
	var PedidoFiltroConsultaReceta pedidoFiltro = new PedidoFiltroConsultaReceta()
	
	pedidoFiltro.filtrosUsuario = true
	
	filtrador.crearFiltros(pedidoFiltro)//El error esta aca pero no se por que
	
	var List<Receta> recetasFiltradas = filtrador.filtrar(recetas)	
	
	Assert.assertTrue(recetasFiltradas.head.equals(pureConAzucarYSinSal))
	
}

}