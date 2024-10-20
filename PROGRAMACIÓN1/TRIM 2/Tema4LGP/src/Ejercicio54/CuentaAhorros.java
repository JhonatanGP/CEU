package Ejercicio54;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class CuentaAhorros {
	// atributos
	private String numeroC;
	private List<Movimiento> movBancarios;

	// constructor
	public CuentaAhorros(String numero) {
		this.numeroC = numero;
		movBancarios = new ArrayList<>();
	}

	// añadir un movimiento a la cuenta
	public void meterMovimiento(Movimiento nuevoMov) {
		movBancarios.add(nuevoMov);
	}

	// total dinero
	public BigDecimal dineroTotal() {
		BigDecimal total = BigDecimal.ZERO;
		if (movBancarios.size() < 0) {
			return total;
		} else {
			for (Movimiento recorrido : movBancarios) {
				if (((Movimiento) movBancarios).getTipo().equals("I")) {
					total = total.add(recorrido.importe).setScale(0);
				} else {
					total = total.subtract(recorrido.importe);
				}
			}
			return total;
		}
	}

	// Método para obtener una lista de cadenas que muestre todos los movimientos
	public Movimiento listaMov() {
		List<Movimiento> listaMovimientos = new ArrayList<>();
		for (Movimiento recorrido : movBancarios) {
			listaMovimientos.add(recorrido);
		}
		return (Movimiento) listaMovimientos;
	}

	// Método para obtener una lista de cadenas que muestre todos los movimientos de
	// retiradas
	public Movimiento listaMovRetiradas() {
		List<Movimiento> listaMovimientosRetiradas = new ArrayList<>();
		for (Movimiento recorrido : movBancarios) {
			if (((Movimiento) movBancarios).getTipo().equals("R")) {
				listaMovimientosRetiradas.add(recorrido);
			}
		}
		return (Movimiento) listaMovimientosRetiradas;
	}

	// Método para obtener una lista de cadenas que muestre todos los movimientos de
	// ingresos
	public Movimiento listaMovIngeresos() {
		List<Movimiento> listaMovimientosIngresos = new ArrayList<>();
		for (Movimiento recorrido : movBancarios) {
			if (((Movimiento) movBancarios).getTipo().equals("I")) {
				listaMovimientosIngresos.add(recorrido);
			}
		}
		return (Movimiento) listaMovimientosIngresos;
	}

	// Método para obtener una lista de cadenas que muestre todos los movimientos de
	// cargos
	public Movimiento listaMovCargos() {
		List<Movimiento> listaMovimientosCargos = new ArrayList<>();
		for (Movimiento recorrido : movBancarios) {
			if (((Movimiento) movBancarios).getTipo().equals("C")) {
				listaMovimientosCargos.add(recorrido);
			}
		}
		return (Movimiento) listaMovimientosCargos;
	}

	// getters and setters
	public String getNumero() {
		return numeroC;
	}

	public void setNumero(String numero) {
		this.numeroC = numero;
	}

	public List<Movimiento> getMovBancarios() {
		return movBancarios;
	}

	public void setMovBancarios(List<Movimiento> movBancarios) {
		this.movBancarios = movBancarios;
	}

	// toString
	@Override
	public String toString() {
		// DecimalFormat formato = new DecimalFormat("#,##0.00€");
		return "CuentaAhorros [numero= " + numeroC + " , movBancarios= " + movBancarios + " ]";
	}

}
