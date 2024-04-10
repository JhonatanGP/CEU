package ej01.modelo;

import java.time.LocalDate;

public class Persona {
	
	private String dni;
	private String nombre;
	private String apellidos;
	private LocalDate fechaNac;
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
	public LocalDate getFechaNac() {
		return fechaNac;
	}
	public void setFechaNac(LocalDate fechaNac) {
		this.fechaNac = fechaNac;
	}
	@Override
	public String toString() {
		return "Persona [dni=" + dni + ", nombre=" + nombre + ", apellidos=" + apellidos + ", fechaNac=" + fechaNac
				+ "]";
	}





}
