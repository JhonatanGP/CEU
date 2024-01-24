package ej26;

import java.util.Objects;

public class Alumno extends Persona{
	
	private String dni;
	private Double nota;
	private Curso curso;
			
	public Curso getCurso() {
		return curso;
	}
	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	public Alumno(String dni) {
		super();
		this.dni = dni;
	}
	// Constructor con el dni,nombre, edad y nota
	public Alumno(String dni, String nombre, Integer edad, Double nota) { 
		super(nombre, edad);
		this.nota = nota;
	}
	public Alumno() {
		
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni.toUpperCase();
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
	@Override
	public String toString() {
		return "Alumno [Dni = " + getDni() + ", Nota = " + getNota() + ", Nombre = " + getNombre() + ", Edad = " + getEdad() + ", Curso = " + getCurso() +"]";
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