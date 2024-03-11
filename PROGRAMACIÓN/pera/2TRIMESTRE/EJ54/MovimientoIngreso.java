package EJ54;

import java.math.BigDecimal;

public class MovimientoIngreso extends Movimiento{
	private String descripcion;

	
	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@Override
	public String toString() {
		return "[ " + super.toString() + " - " + descripcion + "]"; 
	}
	
	@Override
	public String getTipo() {
		return TIPO_INGRESO;
	}
	
	// FORMA 2: DEVOLVIENDO EL IMPORTE DEL MOVIMIENTO EN POSITIVO O EN NEGATIVO
	public BigDecimal getImporteMovimiento() {
		return getImporte();
	}

}

