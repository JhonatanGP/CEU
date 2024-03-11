package Set;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Carrito {

	private LocalDate fechaCreacion;
	private LocalDate fechaModificacion;
	private Cliente cliente;
	private Set<Artículo> articulos;
	
	public Carrito(Cliente cliente) {
		this.cliente = cliente;
		fechaCreacion = LocalDate.now();
		fechaModificacion = LocalDate.now();
		articulos = new HashSet<>();
	}
	
	public Double getTotal() {
		Double total = 0D;
		for (Artículo articulo : articulos) {
			total = total + articulo.getPrecio();
		}
		return total;
	}
	
	public Double getPrecioMedio() {
		if  (getCantidad() == 0) {
			return 0D;
		}
		return getTotal() / getCantidad();
	}
	
	@Override
	public String toString() {
		DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		return "Cliente: " + cliente.getDni() + " / " + cliente.getNombre()
			+ " Artículos: " + getCantidad() + " / " + getTotal() + " euros"
			+ " Fecha última actualización :" + fechaModificacion.format(formato);
	}
	
	public void addArticulo(Artículo articulo) {
		if(articulos.add(articulo)) {
			fechaModificacion =LocalDate.now();
		}
	}
	
	public void borrarArticulo(Artículo articulo) { 	// hay que comprobar si la posicion es correcta:
		if(articulos.remove(articulo)){
			fechaModificacion= LocalDate.now();
		}
	}
	
	public void vaciarCesta() {
		articulos.clear();
		fechaModificacion = LocalDate.now();
	}
	
	public Integer getCantidad() {
		return articulos.size();
	}
	
	public LocalDate getFechaCreacion() {
		return fechaCreacion;
	}
	public LocalDate getFechaModificacion() {
		return fechaModificacion;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public Set<Artículo> getArticulos() {
		return articulos;
	}
	
	
}

