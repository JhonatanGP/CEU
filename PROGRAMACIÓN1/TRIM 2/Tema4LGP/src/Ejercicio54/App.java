package Ejercicio54;

import java.math.BigDecimal;
import java.time.LocalDate;

public class App {

	public static void main(String[] args) {
		
		//Crea una cuenta corriente e imprime el dinero que tenemos 
		CuentaAhorros cuentaCorriente = new CuentaAhorros("12345678910");
		System.out.println(cuentaCorriente);
		
		//Añade 2 cargos, 2 ingresos y 1 retirada 
		cuentaCorriente.meterMovimiento(new Cargo(new BigDecimal(1.000),"b12345"));
		cuentaCorriente.meterMovimiento(new Cargo(new BigDecimal(500),"b54321"));
		
		cuentaCorriente.meterMovimiento(new Ingresos(new BigDecimal(2000),"descripcion1"));
		cuentaCorriente.meterMovimiento(new Ingresos(new BigDecimal(600),"descripcion1"));

		cuentaCorriente.meterMovimiento(new Retiradas(new BigDecimal(100)));

		System.out.println(cuentaCorriente.dineroTotal());
		//no funciona
	}

}
