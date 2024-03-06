package Ejercicio48;

public class Cliente {
	String nombre;
	String DNI;
	
	public Cliente(String nombre, String DNI) {
		this.nombre = nombre;
		this.DNI = DNI;
	}
	
	public String getNombre() {
		return nombre;
	}
	public String getDNI() {
		return DNI;
	}

}