package Ejercicio48;

public class Ropa extends Articulo {
	String talla;
	String color;
	public String getTalla() {
		return talla;
	}
	public String getColor() {
		return color;
	}
	public Ropa(String color, String talla, Integer precio, String descripcion){
		this.color = color;
		this.talla = talla;
		this.precio = precio;
		this.descripcion = descripcion;
	}
	@Override
	public String toString() {
		return "descripcion= " + descripcion + " precio= " + precio + " talla= " + talla + ", color= " + color + "]";
	}
	
}