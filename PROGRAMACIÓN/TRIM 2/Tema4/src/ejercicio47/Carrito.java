package ejercicio47;

import java.util.ArrayList;
import java.util.List;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Carrito {

	private LocalDate fechaCreacion;
	private LocalDate fechaModificacion;
	private Cliente cliente;
	private List<Articulo> articulos;
	
	public LocalDate getFechaCreacion() {
		return fechaCreacion;
	}
	public LocalDate getFechaModificacion() {
		return fechaModificacion;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public List<Articulo> getArticulos() {
		return articulos;
	}
	
	public Carrito(Cliente cliente) {
		this.cliente = cliente;
		this.fechaCreacion = LocalDate.now();
		this.fechaModificacion = LocalDate.now();
		this.articulos = new ArrayList<>();
	}

	public Double getTotal() {
		Double total = 0D;
		for (Articulo articulo : articulos) {
			total = total + articulo.getPrecio();
		}
		return total;
	}
	
	public Double getPrecioMedio() {
		if (getCantidad () == 0) {
			return 0D;
		}
		return getTotal() / getCantidad();
	}
	public Integer getCantidad() {
		return  articulos.size();
	}
	@Override
	public String toString() {
		DateTimeFormatter formato = DateTimeFormatter.ofPattern("HH:mm:ss");
		return "Cliente: " + cliente.getDni() + " / " + cliente.getNombre()
		+ " Artculos: " + getCantidad() + " / " + getTotal() + " euros"
		+ " Fecha ltima actualizacin :" + fechaModificacion.format(formato);

	}
	
	public void addArticulo (Articulo articulo) {
		articulos.add(articulo);
		fechaModificacion = LocalDate.now();
	}
	
	public void borrarArticulo(int posicion) {
		
		// hay que comprobar si la posicion es correcta:
		
		if(posicion >= 0 && posicion<this.articulos.size()) // posicion < getCantidad()
		{
			articulos.remove(posicion);
			fechaModificacion = LocalDate.now();
		}
	}
	
	public void vaciarCesta() {
		articulos.clear();
		fechaModificacion = LocalDate.now();
	}

	
	

}
