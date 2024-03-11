package EJ54;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public abstract class Movimiento {

	
	public static final String TIPO_INGRESO = "I";
	public static final String TIPO_CARGO = "C";
	public static final String TIPO_RETIRADA = "R";
	
	protected LocalDate fecha;
	protected BigDecimal importe;
	
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


	public abstract String getTipo();
	
	
	@Override
	public String toString() {
		DecimalFormat formatoImporte = new DecimalFormat("#,###.##  ");
		DateTimeFormatter formatoFecha = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		
		return getTipo() + " - " + formatoFecha.format(fecha) + " - " + formatoImporte.format(importe);
	}
	
	// FORMA 2: DEVOLVIENDO EL IMPORTE DEL MOVIMIENTO EN POSITIVO O EN NEGATIVO
	public abstract BigDecimal getImporteMovimiento();
	
	
}


