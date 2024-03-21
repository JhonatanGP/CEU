package EJ36;

import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Alumno extends Persona {
	private String dni;
	private Double nota;
	private Curso curso;

	public Alumno(String dni) {
		this.dni = dni.toUpperCase();
		
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
	
	public Curso getCurso() {
		return curso;
	}
	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	public void aprobar() {
		nota = 5.0;
	}
	
	@Override
	public void registrar() {
		super.registrar();
		System.out.println("blas");
	}
	@Override
	public String toString() {
		return "Alumno [dni=" + dni + ", nota=" + nota + ", nombre=" + getNombre()
				+ ", edad=" + getEdad() + ", curso=" + curso + "]";
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
		if (dni == null) {
			return false;
		}
		
		Pattern patron = Pattern.compile("[0-9]{7,8}[A-Z a-z]");
		Matcher match = patron.matcher(dni);
		if (match.matches()) {
			return true;
		} 
		return false;
	}
	
	public Boolean validar() {
		if (curso == null) {
			return false;
		}
		if (getNombre() == null || getNombre().length() < 10) {
			return false;
		}
		if (getEdad() == null || getEdad() < 12 || getEdad() > 65) {
			return false;
		}
		if(!validarDNI()) {
			return false;
		}
		return true;
		
	}
	
	
}

