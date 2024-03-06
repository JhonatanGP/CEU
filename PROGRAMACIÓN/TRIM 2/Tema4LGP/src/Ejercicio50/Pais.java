package Ejercicio50;

import java.util.Objects;

public class Pais {

	String codigo;
	String descripcion;
	
	public Pais (String codigo, String descripcion) {
		this.codigo = codigo;
		this.descripcion = descripcion;
	}

	//getters and setters
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	//to string
	@Override
	public String toString() {
		return "Pais [codigo=" + codigo + ", descripcion=" + descripcion + "]";
	}
	
	//equals y hash code
	@Override
	public int hashCode() {
		return Objects.hash(codigo.toUpperCase());
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Pais other = (Pais) obj;
		return Objects.equals(codigo.toUpperCase(), other.codigo.toUpperCase());
	}
	
	
	
	
	
	
}
