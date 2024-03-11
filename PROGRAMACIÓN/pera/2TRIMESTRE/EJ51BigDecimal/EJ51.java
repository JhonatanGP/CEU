package EJ51BigDecimal;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class EJ51 {

	public static void main(String[] args) {
		
		// Apartado 1	    
	      
	    Scanner scanner = new Scanner(System.in);
		List<BigDecimal> numeros = new ArrayList<>();
	
		while (numeros.size()<5)
		{
			System.out.println("Dame un nmero:");
			BigDecimal num = scanner.nextBigDecimal();
			if (!numeros.isEmpty()) {
				BigDecimal ultimo = numeros.get(numeros.size()-1);
				if (num.compareTo(ultimo) > 0) {
					numeros.add(num);
				}
				else {
					System.out.println("No es mayor que el anterior"); // no guardo nada, la lista no varia.
				}
			}
			else { // el primero
				numeros.add(num);
			}
		
		}
		System.out.println("Lista de nmeros: ");
		System.out.println(numeros);
		
		// Apartado 2
		BigDecimal suma = BigDecimal.ZERO;				
		
		// BigDecimal suma = new BigDecimal(0); // se puede hacer as tambin
		for (BigDecimal numero : numeros) {
			suma = suma.add(numero);
		}
		
		suma = suma.setScale(1, RoundingMode.HALF_DOWN);
		System.out.println("Suma redondeada: " + suma);
		
		// Apartado 3
		BigDecimal division = numeros.get(0).divide(numeros.get(1), 3, RoundingMode.HALF_UP);
		System.out.println("Divisin: " + division);
		
		scanner.close();
		
	}
}

