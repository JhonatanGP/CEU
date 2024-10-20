package Ejercicio53;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;

public class Hucha {
	BigDecimal dineroAhorrado;

	// constructor

	// Cuando se crea una hucha nueva estará inicialmente vacía
	// redondeado a 2 decimales
	public Hucha() {
		this.dineroAhorrado = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_DOWN);
	}
	// metodos

	// getters y setters
	public BigDecimal getDineroAhorrado() {
		return dineroAhorrado;
	}

	public void setDineroAhorrado(BigDecimal dineroAhorrado) {
		this.dineroAhorrado = dineroAhorrado;
	}

	// recibe un BigDecimal con el importe a introducir y nos devuelve
	// otro BigDecimal con el importe que queda
	public BigDecimal meterDinero(BigDecimal cantidadAhorrada) {
		dineroAhorrado = cantidadAhorrada.setScale(2, RoundingMode.HALF_DOWN).add(dineroAhorrado);
		return dineroAhorrado;
	}

	// recibe un BigDecimal con el importe a sacar y nos devuelve otro
	// BigDecimal con el importe finalmente sacado
	public BigDecimal sacarDinero(BigDecimal cantidadASacar) {
		if (cantidadASacar.compareTo(dineroAhorrado) > 0) {
			BigDecimal sacar = dineroAhorrado;
			dineroAhorrado = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_DOWN);
			return sacar;

		} else {
			BigDecimal resto = dineroAhorrado.subtract(cantidadASacar);
			dineroAhorrado = resto.setScale(2, RoundingMode.HALF_DOWN);
			return resto;
		}
	}

	// nos devuelve un BigDecimal con el importe que tenemos en la hucha
	public BigDecimal contarDinero() {
		return dineroAhorrado.setScale(2, RoundingMode.HALF_DOWN);
	}

	// saca todo el dinero de la Hucha y nos devuelve un BigDecimal con todo lo
	// sacado
	public BigDecimal romperHucha() {
		BigDecimal sacar = dineroAhorrado;
		dineroAhorrado = BigDecimal.ZERO.setScale(2, RoundingMode.HALF_DOWN);
		return sacar;
	}

	@Override
	public String toString() {
		DecimalFormat formato = new DecimalFormat("#,##0.00€");
		return "Hucha: " + formato.format(dineroAhorrado);
	}

}
