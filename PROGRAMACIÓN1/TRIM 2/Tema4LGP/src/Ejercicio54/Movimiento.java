package Ejercicio54;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;


public abstract class Movimiento {
	//constantes
	public static final String CARGO = "C";
	public static final String RETIRADA = "R";
	public static final String INGRESO = "I";

	protected BigDecimal importe;
	protected LocalDate fecha;

	
	// constructor
	public Movimiento(BigDecimal importe) {
		this.importe = importe;
		this.fecha = LocalDate.now();
	}

	// metodos abstractos
	public abstract String getTipo();

	// getters and setters
	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public BigDecimal getImporte() {
		return importe;
	}

	public void setImporte(BigDecimal importe) {
		this.importe = importe;
	}

	@Override
	public String toString() {
		DateTimeFormatter formatoFecha = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		DecimalFormat formatoEuros = new DecimalFormat("#,##0.00€");
		return "Movimiento [importe=" + formatoEuros.format(importe) + ", fecha=" + fecha.format(formatoFecha) + "]";
	}
}
