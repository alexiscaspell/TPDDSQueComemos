package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Condimento
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Ingrediente
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Temporada
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.TipoReceta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.RecetasRepository
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia.UsuariosRepository
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Date
import java.util.HashSet
import org.junit.Assert
import org.junit.Test
import queComemos.entrega3.dominio.Dificultad

class PruebasMongo {
	
	//REPOS
	private RecetasRepository repoReceta = new RecetasRepository()	
	private UsuariosRepository repoUsuario = new UsuariosRepository()

	//FECHA
	var DateFormat format = new SimpleDateFormat("dd-mm-yyyy")
 	var Date fecha = format.parse("24-12-1900")
	
	//RECETAS
	public def Receta pureALaBarca(){	
		var receta = new Receta()
		receta.agregarCondimento(Condimento.ACEITE, 100)
		receta.agregarIngrediente(Ingrediente.AJO, 20)
		receta.anio = 2000
		receta.calorias = 50;
		receta.dificultad = Dificultad.MEDIANA
		receta.tipo = TipoReceta.PUBLICA 
		receta.explicacion = "ponemos true y false a todo"
		receta.temporadas = new HashSet();
		receta.temporadas.add(Temporada.VERANO)
		receta.nombre = "pureALaBarca"
		
		return receta
	}

	public def Receta milanesasALaBarca(){
		var receta = new Receta()
		receta.agregarCondimento(Condimento.AZUCAR, 200)
		receta.agregarCondimento(Condimento.CALDO, 300)
		receta.agregarIngrediente(Ingrediente.ACELGA, 10)
		receta.agregarIngrediente(Ingrediente.ARROZ_YAMANI, 30)
		receta.anio = 2015
		receta.calorias = 100;
		receta.dificultad = Dificultad.MEDIANA
		receta.tipo = TipoReceta.PUBLICA 
		receta.explicacion = "ponemos true y false a todo"
		receta.temporadas = new HashSet();
		receta.temporadas.add(Temporada.OTONIO)
		receta.temporadas.add(Temporada.VERANO)
		receta.nombre = "milanesasALaBarca"
		
		return receta
	}

	public def Receta lomoALaBarca(){
				
		var receta = new Receta()
		receta.agregarCondimento(Condimento.ACEITE, 100)
		receta.agregarCondimento(Condimento.AZUCAR, 200)
		receta.agregarCondimento(Condimento.CALDO, 300)
		receta.agregarIngrediente(Ingrediente.ACELGA, 10)
		receta.agregarIngrediente(Ingrediente.AJO, 20)
		receta.agregarIngrediente(Ingrediente.ARROZ_YAMANI, 30)
		receta.anio = 2015
		receta.calorias = 100;
		receta.dificultad = Dificultad.FACIL
		receta.tipo = TipoReceta.PUBLICA 
		receta.explicacion = "ponemos true y false a todo"
		receta.temporadas = new HashSet();
		receta.temporadas.add(Temporada.INVIERNO)
		receta.nombre = "lomoALaBarca"
		
		return receta
	}
	
	
	
	//TEST
	
	@Test
	def pruebaCargaDeDatos(){
		
		var Usuario barca = new UsuarioPosta(75.0, 1.90, Rutina.LEVE, "Ricky Barca", Sexo.MASCULINO, fecha) 
			barca.nickName = "barca"
			barca.password = "testo"
			
		lomoALaBarca.usuarioCreador = barca.nickName
		milanesasALaBarca.usuarioCreador = barca.nickName
		pureALaBarca.usuarioCreador = barca.nickName
		
		barca.recetas.add(lomoALaBarca)	
		barca.recetas.add(milanesasALaBarca)	
		barca.recetas.add(pureALaBarca)	
			
		barca.favoritas.add(lomoALaBarca)
		barca.favoritas.add(milanesasALaBarca)
		barca.favoritas.add(pureALaBarca)
		
		repoReceta.create(lomoALaBarca)
		repoReceta.create(milanesasALaBarca)
		repoReceta.create(pureALaBarca)
		
		repoUsuario.create(barca)

		Assert.assertTrue(
			repoUsuario.findByName("Ricky Barca").nickName == barca.nickName
		)
	}
}

























