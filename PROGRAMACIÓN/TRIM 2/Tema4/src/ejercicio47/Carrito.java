package ejercicio47;

import java.util.List;

import ejercicio45.LocalDate;

public class Carrito {

	private LocalDate fechaCreacion;
	private LocalDate fechaUltimaAct;
	private String cliente;
	private List<Articulo> listaArticulo;

	public LocalDate getFechaUltimaAct() {
		return fechaUltimaAct;
	}

	public void setFechaUltimaAct(LocalDate fechaUltimaAct) {
		this.fechaUltimaAct = fechaUltimaAct;
	}

	public LocalDate getFechaCreacion() {
		return fechaCreacion;
	}

	public String getCliente() {
		return cliente;
	}

	public List<Articulo> getListaArticulo() {
		return listaArticulo;
	}

}
