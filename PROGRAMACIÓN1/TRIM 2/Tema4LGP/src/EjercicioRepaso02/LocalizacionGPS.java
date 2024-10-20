package EjercicioRepaso02;

import java.math.BigDecimal;

public class LocalizacionGPS {
	protected BigDecimal latitud;
	protected BigDecimal longitud;
	
	public LocalizacionGPS(BigDecimal latitud, BigDecimal longitud) {
	this.latitud = latitud;
	this.longitud = longitud;
	}
}
