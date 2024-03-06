package ejercicioRepaso02;

import java.math.BigDecimal;

public class Movil extends Telefono {

	private BigDecimal latitud;
	private BigDecimal longitud;
	
	public Movil(BigDecimal latitud,BigDecimal longitud,Integer numero) {
		super(numero);
		this.latitud= latitud;
		this.longitud=longitud;		
	}

}

