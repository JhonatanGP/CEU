package EJ54;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

public class CuentaAhorros {
	private String numero; // String porque puede empezar por cero
	private List<Movimiento> movimientos;
	
	public CuentaAhorros(String numero) {
		this.numero = numero;
		this.movimientos = new ArrayList<>();		
	}
	
	public String getNumCuenta() {
		return numero;
	}

	public void setNumCuenta(String numCuenta) {
		this.numero = numCuenta;
	}
	
	public void addMovimiento(Movimiento mov) {
		movimientos.add(mov);
	}
	
	public BigDecimal getTotal() {
		BigDecimal saldoTotal = BigDecimal.ZERO;
	
        for (Movimiento movimiento : movimientos) {
            if (movimiento.getTipo().equals("I")) {
            	saldoTotal = saldoTotal.add(movimiento.getImporte());
            } else {
            	saldoTotal = saldoTotal.subtract(movimiento.getImporte());
            }
        }
        return saldoTotal.setScale(2, RoundingMode.HALF_DOWN);	
	}
	
	
	// FORMA 2: DEVOLVIENDO EL IMPORTE DEL MOVIMIENTO EN POSITIVO O EN NEGATIVO
	/*
	public BigDecimal getTotalDinero() {
		BigDecimal suma = BigDecimal.ZERO;
		for (Movimiento movimiento : movimientos) {
			suma = suma.add(movimiento.getImporteMovimiento());
		}
		return suma;
	}
	*/
	
	
	
	
	public List<String> getMovimientosString(){
		List<String> resultado = new ArrayList<>();
		for (Movimiento mov : movimientos) {
			resultado.add(mov.toString());
		}
		return resultado;
	}	
	
	public List<String> getCargos(){
		List<String> resultado = new ArrayList<>();
		for (Movimiento mov : movimientos) {
			if (mov.getTipo().equals(Movimiento.TIPO_CARGO)) {
				resultado.add(mov.toString());
			}
		}
		return resultado;
	}
	
	public List<String> getIngresos(){
		List<String> resultado = new ArrayList<>();
		for (Movimiento mov : movimientos) {
			if (mov.getTipo().equals(Movimiento.TIPO_INGRESO)) {
				resultado.add(mov.toString());
			}
		}
		return resultado;
	}
	public List<String> getRetiradas(){
		List<String> resultado = new ArrayList<>();
		for (Movimiento mov : movimientos) {
			if (mov.getTipo().equals(Movimiento.TIPO_RETIRADA)) {
				resultado.add(mov.toString());
			}
		}
		return resultado;
	}
	
}

