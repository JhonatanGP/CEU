package Ejercicio54;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Retiradas extends Movimiento {

	public Retiradas(BigDecimal importe) {
		super(importe);
	}

	@Override
	public String toString() {
		return "[" + getTipo() + super.importe + super.fecha + "]";
	}

	@Override
	public String getTipo() {

		return RETIRADA;
	}

}
