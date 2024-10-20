package Ejercicio48;

public class Libro extends Articulo {
	String autor;
	public String getAutor() {
		return autor;
	}
	public Libro(Integer precio, String descripcion, String autor) {
		this.autor = autor;
		this.precio = precio;
		this.descripcion = descripcion;
	}
	@Override
	public String toString() {
		return "Libro [autor= " + autor + " descripcion= " + descripcion + ", precio=" + precio + "]";
	}
	
}
