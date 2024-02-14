package ejercicio51BigDecimal;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ejercicio51 {

	public static void main(String[] args) {

//1. Solicita al usuario 5 números BigDecimal y los metes en una lista. Cada número que te proporcione tiene que se mayor al anterior, si no es así, vuelve a solicitarlo.
	Scanner scanner = new Scanner(System.in);
	List<BigDecimal> numeros = new ArrayList<>();

	while (numeros.size()<5) {
		System.out.println("Introduce 5 números");
		BigDecimal num = scanner.nextBigDecimal();
		
		if (!numeros.isEmpty()) {
			
		}

	}
				
//2. Cuando termines, imprime la suma de todos los números. La suma debe estar redondeada a 1 decimal con HALF_DOWN
		
//3. Luego imprime la división del primer número entre el segundo, redondeando el resultado a 3 decimales con HALF_UP. 
				
				
		
		BigDecimal x = new BigDecimal("56.7");
		DecimalFormat formato = new DecimalFormat("#,###.00");
		System.out.println(formato.format(x));
	}

}


