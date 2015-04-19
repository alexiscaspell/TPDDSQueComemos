package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos
import java.util.ArrayList
import java.util.Date

public interface Usuario {	

	//Métodos
	
	def double calcularIMC()
	
	def void agregarReceta()
	
	def void estadoRutina()	
	
	def boolean cumpleCondicion()
	
	def boolean nombreCorrecto()	
	
	def boolean cumpleCamposObligatorios()
	
	def boolean usuarioValido()
	
	def boolean agregarUsuario(String nombre, double peso, double altura, Date fechaNacimiento, Rutinas rutinaUsuario)
		
	//Getters	
	
	def double getPeso()
	
	def double getAltura()
	
	def Rutinas getRutina()

	def ArrayList<String> getPreferenciasAlimenticias()
	
	//Setters
	
	def void setPeso(double peso)
	
	def void setAltura(double altura)
	
	def void setNombre(String nombre)
    
    def void setFechaNacimiento(Date fecha)
    
    def void setPreferenciasAlimenticias (ArrayList<String> listaDeAlimentos)
    
    def void setPlatosQueNoLeGustan (ArrayList<String> listaDeAlimentos)
    
    def void setRutina(Rutinas rutina)
}

