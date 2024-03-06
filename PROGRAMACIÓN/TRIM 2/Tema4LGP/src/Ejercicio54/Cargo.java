package Ejercicio54;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Cargo extends Movimiento {

	private String cif;
	
	public Cargo(BigDecimal importe, String ncif) {
		super(importe);
		this.cif = ncif;
	}
	
	public String getCif() {
		return cif;
	}

	public void setCif(String cif) {
		this.cif = cif;
	}
	
	@Override
	public String toString() {
		return "[" + getTipo() + super.importe + super.fecha + importe + cif + "]";
	}

	@Override
	public String getTipo() {
		
		return CARGO;
	}


}
