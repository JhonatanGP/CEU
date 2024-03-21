package EJ54;

import java.math.BigDecimal;

public class MovimientoCargo extends Movimiento{
	
	private String cif;
	
	public String getCif() {
		return cif;
	}

	public void setCif(String cif) {
		this.cif = cif;
	}
	
	@Override
	public String toString() {
		return "[ " + super.toString() + " - " + cif + "]"; 
	}

	@Override
	public String getTipo() {
		return TIPO_CARGO;
	}
	
	// FORMA 2: DEVOLVIENDO EL IMPORTE DEL MOVIMIENTO EN POSITIVO O EN NEGATIVO
	public BigDecimal getImporteMovimiento() {
		return getImporte().negate();
	}		
	
}


