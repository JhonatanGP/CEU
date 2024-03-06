package Ejercicio21;

public class Alumno extends Persona{	
	private String dni;
	private Double nota;


	// constructores
	public Alumno(String dni, String nombre, Integer edad, Double nota) {
		super(nombre, edad);
		this.dni = dni;
		this.nota = nota;
	}
	public Alumno() {
		super();
		this.dni = "";
		this.nota = 0.00;
	}
	// metodos
	public String getDni() {
		return dni;
	}
	public void setDni(String dniNuevo) {
		this.dni = dniNuevo;
	}
	public Double getNota() {
		return nota;
	}
	public void setNota(Double nota) {
		this.nota = nota;
	}
	public void aprobar() {
		this.nota = 5.0;
	}

	public Alumno (String d) {
		dni = d;
	}
}
