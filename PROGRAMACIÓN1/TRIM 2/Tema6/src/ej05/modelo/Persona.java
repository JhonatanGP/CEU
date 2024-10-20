package ej05.modelo;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

import ej05.services.DatosIncompletosException;


public class Persona {

	private String dni;
	private String nombre;
	private String apellidos;
	private LocalDate fechaNacimiento; // para ej. 7
	
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	
	
	
	public LocalDate getFechaNacimiento() {
		return fechaNacimiento;
	}
	public void setFechaNacimiento(LocalDate fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	public Boolean isDatosIncompletos() {
		return dni.isEmpty() || nombre.isEmpty() || apellidos.isEmpty() || fechaNacimiento == null;
	}
	
	@Override
	public String toString() {
		DateTimeFormatter fomato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		return "Persona [dni=" + dni + ", nombre=" + nombre + ", apellidos=" + apellidos + ", fechaNacimiento="
				+ fomato.format(fechaNacimiento) + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(dni);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Persona other = (Persona) obj;
		return Objects.equals(dni, other.dni);
	}
	
	public Boolean validar() throws DatosIncompletosException
	{
		if(dni.isEmpty() || nombre.isEmpty() || apellidos.isEmpty() || fechaNacimiento == null)		
			throw new DatosIncompletosException();
	
		return true;
		
	}
	
	
	

}

