package Ejercicio54;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Ingresos extends Movimiento{

	private String descripcion;
	
	public Ingresos(BigDecimal importe, String descripcion) {
		super(importe);
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@Override
	public String toString() {
		return "[" + getTipo() + super.importe + super.fecha + descripcion + "]";
	}

	@Override
	public String getTipo() {
		
		return INGRESO;
	}

	

	
}
