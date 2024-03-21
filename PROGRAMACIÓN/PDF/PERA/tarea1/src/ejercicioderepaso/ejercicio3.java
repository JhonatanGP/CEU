package ejercicioderepaso;

import java.util.Scanner;

public class ejercicio3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		Scanner scanner = new Scanner(System.in);
		
		
		System.out.println("Indique un valor");
		
		String primervalor = scanner.nextLine();
		
		System.out.println("Indique un segundo valor");
		
		String segundovalor = scanner.nextLine();
		scanner.close();
		
		Long x1=Long.parseLong(primervalor);
		Long x2 =Long.parseLong(segundovalor);
		
		Long calculo= x1 * x2;
		System.out.println("El resultado sería"+ " "+ calculo);
		
		
		
		
		

	}

}
