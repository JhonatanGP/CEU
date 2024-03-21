package ejercicioderepaso;

import java.util.Scanner;

public class ejercicio2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Indique un valor");
		
		Integer primervalor = scanner.nextInt();
		
		System.out.println("Indique un segundo valor");
		
		Integer segundovalor = scanner.nextInt();
		scanner.close();
		
		
		Integer calculo= primervalor * segundovalor;
		System.out.println("El resultado sería"+ " "+ calculo);
		
		
		
		
		
		
		
		
		
		
	}

}
