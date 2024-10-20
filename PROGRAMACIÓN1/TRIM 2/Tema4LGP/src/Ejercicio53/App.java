package Ejercicio53;

import java.math.BigDecimal;

public class App {

	public static void main(String[] args) {

		// Crea una hucha. Debe imprimir 0,00 €
		Hucha hucha1 = new Hucha();
		System.out.println(hucha1);

		// Mete 100 euros. Debe imprimir 100,00 €
		BigDecimal cien = new BigDecimal(100);
		hucha1.meterDinero(cien);
		System.out.println(hucha1);

		// Mete 50,501 euros. Debe imprimir 150,50 €
		hucha1.meterDinero(new BigDecimal(50.501));
		System.out.println(hucha1);

		// Saca 20,5 euros. Debe imprimir 130,00 €
		BigDecimal retirado = hucha1.sacarDinero(new BigDecimal(20.5));
		System.out.println(hucha1);

		// Intenta sacar 200 €. Debe imprimir 0,00 €
		hucha1.sacarDinero(new BigDecimal(200));
		System.out.println(hucha1);

		// Vuelve a meter en la hucha el importe que habías sacado. Debe imprimir 130,00
		// €
		hucha1.meterDinero(retirado);
		System.out.println(hucha1);

		// Llama a contarDinero(). Lo que devuelva, mételo en la hucha. Debe imprimir
		// 260,00 €
		hucha1.meterDinero(hucha1.contarDinero());
		System.out.println(hucha1);

		// Llama a romperHucha(). Lo que devuelva, mételo en la hucha de nuevo
		BigDecimal roto = hucha1.romperHucha();
		hucha1.meterDinero(roto);
		System.out.println(hucha1);

	}

}
