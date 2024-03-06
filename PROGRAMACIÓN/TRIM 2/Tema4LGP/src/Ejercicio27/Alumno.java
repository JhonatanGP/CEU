package Ejercicio27;

import java.util.Objects;

import Ejercicio22.Curso;
import Ejercicio22.Persona;

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
	// constructores
	public Alumno(String dni, String nombre, Integer edad, Double nota) {
		super(nombre, edad);
		this.dni = dni.toUpperCase();
		this.nota = nota;
	}
	public Alumno() {
		super();
		this.dni = "";
		if(dni != null) {
		dni.toUpperCase();
		}
		this.nota = 0.00;
	}
	// metodos
	public String getDni() {
		return dni.toUpperCase();
	}
	public void setDni(String dniNuevo) {
		dni.toUpperCase();
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
	@Override
	public String toString() {
		return "Alumno [dni=" + dni + ", nota=" + nota + ", curso=" + curso + "]";
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
	public Boolean validarDNI() {
		return (dni!=null && dni.length()==9);
	}
	
	
	
	
	
	
	
}