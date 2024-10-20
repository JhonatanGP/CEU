package Ejercicio19;

//ejercicio 18
public class Alumno {

	private String dni;
	private String nombre;
	private Integer edad;
	private Double nota;

	// constructores
	public Alumno(String dni, String nombre, Integer edad, Double nota) {
		super();
		this.dni = dni;
		this.nombre = nombre;
		this.edad = edad;
		this.nota = nota;
	}

	public Alumno() {
		this.dni = "";
		this.nombre = "";
		this.edad = 0;
		this.nota = 0.00;
	}

	public String getDni() {
		return dni;
	}

	// metodos
	public void setDni(String dniNuevo) {
		this.dni = dniNuevo;
	}

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

	public Double getNota() {
		return nota;
	}

	public void setNota(Double nota) {
		this.nota = nota;
	}

	// ejercicio 19
	public void aprobar() {
		this.nota = 5.0;
	}

}
