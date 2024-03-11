package EJ54;

import java.math.BigDecimal;

public class MovimientoRetirada extends Movimiento{

	

	@Override
	public String toString() {
		return "[ " + super.toString() + "]"; 
	}
	
	@Override
	public String getTipo() {
		return TIPO_RETIRADA;
	}
	
	// FORMA 2: DEVOLVIENDO EL IMPORTE DEL MOVIMIENTO EN POSITIVO O EN NEGATIVO
	public BigDecimal getImporteMovimiento() {
		return getImporte().negate();
	}
}

