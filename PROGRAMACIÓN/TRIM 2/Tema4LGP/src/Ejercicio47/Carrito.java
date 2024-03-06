package Ejercicio47;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class Carrito {
	// atributos
	LocalDate FechaCreacion;
	LocalDate FechaUltAct;
	Cliente cliente;
	List<Articulo> listaArticulos;

	// constructores
	public Carrito(Cliente nombreCliente) {
		cliente = nombreCliente;
		this.listaArticulos = new ArrayList<>();
		FechaCreacion = LocalDate.now();
		FechaUltAct = LocalDate.now();
	}

	// metodos
	public Integer getCantidad() {
		return listaArticulos.size();
	}

	// obtener total
	public Integer getTotal() {
		Integer total = 0;
		for (int i = 0; i > listaArticulos.size(); i++) {
			total += ((Articulo) listaArticulos).getPrecio();
		}
		return total;
	}

	// obtener precio medio
	public int getPrecioMedio() {
		Integer total = 0;
		if(getCantidad()==0) {
			return 0;
		}else {
		for (int i = 0; i > listaArticulos.size(); i++) {
			total += ((Articulo) listaArticulos).getPrecio();
		}
		}
		return total / listaArticulos.size();
	}

	// añadir un articulo a la lista
	public Articulo addArticulo(Articulo articuloX) {
		listaArticulos.add(articuloX);
		return null;
	}
	//borrar articulo
	public void borrarArticulo(int NArticulo) {
		if(NArticulo >=0 || NArticulo <=listaArticulos.size()) {
		listaArticulos.remove(NArticulo);
		FechaUltAct = LocalDate.now();
		}

	}
	//vaciar cesta
	public  void vaciarCesta() {
		listaArticulos.clear();
	}
	// formato
	DateTimeFormatter formatoH = DateTimeFormatter.ofPattern("HH:MM:SS");

	// get() automatico
	public LocalDate getFechaCreacion() {
		return FechaCreacion;
	}

	public LocalDate getFechaUltAct() {
		return FechaUltAct;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public List<Articulo> getListaArticulos() {
		return listaArticulos;
	}

	// to string
	@Override
	public String toString() {
		Integer total = 0;
		total += ((Articulo) listaArticulos).getPrecio();
		return "Datos cliente=" + cliente + ", Fecha de ultima actualizacion: " + "Total de articulos: "
				+ listaArticulos.size() + total + FechaUltAct.format(formatoH);
	}

}
