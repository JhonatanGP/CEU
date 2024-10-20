package Ejercicio47;

public class Articulo {
	String descripcion;
	Integer precio;
	public String getDescripcion() {
		return descripcion;
	}
	
	public Integer getPrecio() {
		return precio;
	}

	@Override
	public String toString() {
		return "Articulo [descripcion=" + descripcion + ", precio=" + precio + "]";
	}
}