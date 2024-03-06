package Ejercicio25;

//padre
public class Persona {
	private String nombre;
	private Integer edad;
	
	// constructor
	public Persona() {
		this.nombre = "";
		this.edad = 0;
	}

	public Persona(String nombre, Integer edad) {
		this.nombre = nombre;
		this.edad = edad;
	}

	// getters and setters
	public String getNombe() {
		return nombre;
	}

	public void setNombe(String nombe) {
		this.nombre = nombe;
	}

	public Integer getEdad() {
		return edad;
	}

	public void setEdad(Integer edad) {
		this.edad = edad;
	}

	@Override
	public String toString() {
		return "Persona [nombre=" + nombre + ", edad=" + edad + "]";
	}
	

}