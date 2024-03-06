package Ejercicio51;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		// Solicita al usuario 5 números BigDecimal y los metes en una lista
		// creamos la lista:
		List<BigDecimal> listaBigDecimal = new ArrayList<>();
		BigDecimal suma = new BigDecimal(0);
		
		//para repetir 5 veces
		for (int i = 0; i < 5; i++) {
			BigDecimal numeroX;
			
			if (i == 0) {
				System.out.println("Dime el big decimal " + (i + 1));
				numeroX = scanner.nextBigDecimal();
				listaBigDecimal.add(numeroX);
				
			} else {

				do {
					System.out.println("Dime el big decimal " + (i + 1));
					numeroX = scanner.nextBigDecimal();
					
					// Cada número que te proporcione tiene que se mayor al anterior
				} while (numeroX.compareTo(listaBigDecimal.get(i - 1)) <= 0);
				listaBigDecimal.add(numeroX);
			}
		}
		System.out.println(listaBigDecimal);
		
		//Cuando termines, imprime la suma de todos los números. La suma debe estar
		//redondeada a 1 decimal con HALF_DOWN 

		for(BigDecimal numeroBig : listaBigDecimal) {
			suma = suma.add(numeroBig);
		}
		System.out.println(suma.setScale(2, RoundingMode.HALF_DOWN));
		
		//Luego imprime la división del primer número entre el segundo, redondeando el
		//resultado a 3 decimales con HALF_UP.
		BigDecimal division = new BigDecimal(0);
		
		BigDecimal numero0 = listaBigDecimal.get(0);
		BigDecimal numero1 = listaBigDecimal.get(1);
		
		division = numero0.divide(numero1, 3, RoundingMode.HALF_UP);
		System.out.println("La division entre posicion 0 y posicion 1 es" + division);
		
		scanner.close();
	}

}
