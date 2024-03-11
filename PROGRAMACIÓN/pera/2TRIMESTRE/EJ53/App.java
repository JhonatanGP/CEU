package EJ53;

import java.math.BigDecimal;

public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
		//1 Crea una hucha. Debe imprimir 0,00 € 
		Hucha hucha= new Hucha();
		System.out.println(hucha);
		
		//2 Mete 100 euros. Debe imprimir 100,00 € 
		hucha.meterDinero(new BigDecimal("100 "));
		System.out.println(hucha);
		
		//3 Mete 50,501 euros. Debe imprimir 150,50 € 
		hucha.meterDinero(new BigDecimal ("50.501 "));
		System.out.println(hucha);
		
		//4 Saca 20,5 euros. Debe imprimir 130,00 € 
		hucha.sacarDinero(new BigDecimal("20.5 "));
		System.out.println(hucha);
		
		//5 Intenta sacar 200 €. Debe imprimir 0,00 €
		BigDecimal loQueHeSacado= hucha.sacarDinero(new BigDecimal("200 "));
		System.out.println(hucha);
		
		//6 Vuelve a meter en la hucha el importe que habías sacado. Debe imprimir 130,00 €
		hucha.meterDinero(loQueHeSacado);
		System.out.println(hucha);
		
		//7 Llama a contarDinero(). Lo que devuelva, mételo en la hucha. Debe imprimir 260,00 € 
		hucha.meterDinero(hucha.contarDinero());
		System.out.println(hucha);
		
		//8 Llama a romperHucha(). Lo que devuelva, mételo en la hucha de nuevo. Debe imprimir 260,00 € 
		BigDecimal loQueHeRoto =hucha.romperHucha();
		hucha.meterDinero(loQueHeRoto);
		System.out.println(hucha);
		
		
		
	}

}
