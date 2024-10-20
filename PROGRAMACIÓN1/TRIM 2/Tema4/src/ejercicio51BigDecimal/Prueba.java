package ejercicio51BigDecimal;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class Prueba {

	public static void main(String[] args) {

		BigDecimal x = new BigDecimal("56.7");
		DecimalFormat formato = new DecimalFormat("#,###.00");
		System.out.println(formato.format(x));
		
		
	}

}
