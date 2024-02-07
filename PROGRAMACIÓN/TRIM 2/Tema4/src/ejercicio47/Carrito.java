package ejercicio47;

import java.util.List;

import ejercicio45.LocalDate;

public class Carrito {

	private LocalDate fechaCreacion; 
	private LocalDate fechaUltimaAct;
	private String cliente;
	private List <Articulo> listaArticulo;
	
	public LocalDate getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(LocalDate fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public LocalDate getFechaUltimaAct() {
		return fechaUltimaAct;
	}
	public void setFechaUltimaAct(LocalDate fechaUltimaAct) {
		this.fechaUltimaAct = fechaUltimaAct;
	}
	public String getCliente() {
		return cliente;
	}
	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	public List<Articulo> getListaArticulo() {
		return listaArticulo;
	}
	public void setListaArticulo(List<Articulo> listaArticulo) {
		this.listaArticulo = listaArticulo;
		
	}
	
	
	
	
	
	
}
