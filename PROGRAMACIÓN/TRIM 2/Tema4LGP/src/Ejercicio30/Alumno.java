package Ejercicio30;

import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Alumno extends Persona {
	private String dni;
	private Double nota;

	// constructores
	public Alumno(String dni, String nombre, Integer edad, Double nota) {
		super(nombre, edad);
		this.dni = dni.toUpperCase();
		this.nota = nota;
	}

	public Alumno() {
		super();
		this.dni = "";
		if (dni != null) {
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

	public Alumno(String d) {
		dni = d;
	}

	@Override
	public String toString() {
		return "Alumno [dni=" + dni + ", nota=" + nota +  "]";
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
	
	public boolean validarDNI() {
	if(dni==null) {
		return false;
	}
		
		Pattern patron = Pattern.compile("[0-9]{7,8}[A-Z a-z]");
	
		Matcher match = patron.matcher(dni);
	
	if(match.matches() ){
		return true;
	}
	
	return false;
	}
	
	
	
}
