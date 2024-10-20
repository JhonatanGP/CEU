package Ejercicio22;

import java.util.Objects;

public class Alumno extends Persona {
	private String dni;
	private Double nota;
	private Curso curso;

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

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

	public Alumno(String d) {
		dni = d;
	}

	@Override
	public String toString() {
		return "Alumno [dni=" + dni + ", nota=" + nota + ", curso=" + curso + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(curso, dni, nota);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Alumno other = (Alumno) obj;
		return Objects.equals(dni, other.dni);
	}	
}		