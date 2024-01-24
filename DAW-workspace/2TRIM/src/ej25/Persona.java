package ej25;

public class Persona {
	private String nombre;
	private Integer edad;
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Integer getEdad() {
		return edad;
	}
	public void setEdad(Integer edad) {
		this.edad = edad;
	}
	
	public Persona(String nombre, Integer edad) {
		this.nombre = nombre;
		this.edad = edad;
	}
	public Persona() {
		
	}
	@Override
	public String toString() {
		return "Persona [nombre=" + nombre + ", edad=" + edad + "]";
	}
	
	
}
