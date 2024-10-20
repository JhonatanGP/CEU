package ejercicio53;

import java.math.BigDecimal;

public class App {

	public static void main(String[] args) {
		// 1
		Hucha hucha = new Hucha();
		System.out.println(hucha);
		// 2
		hucha.meterDinero(new BigDecimal("100"));
		System.out.println(hucha);
		// 3
		hucha.meterDinero(new BigDecimal("50.501"));
		System.out.println(hucha);
		// 4
		hucha.sacarDinero(new BigDecimal("20.50"));
		System.out.println(hucha);
		// 5
		BigDecimal loQueHeSacado = hucha.sacarDinero(new BigDecimal("200"));
		System.out.println(hucha);
		// 6
		hucha.meterDinero(loQueHeSacado);
		System.out.println(hucha);
		// 7
		BigDecimal contado = hucha.contarDinero();
		System.out.println(hucha);
	}

}
