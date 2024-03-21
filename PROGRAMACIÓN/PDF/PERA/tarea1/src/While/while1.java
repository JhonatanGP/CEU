package While;

import java.util.Scanner;

public class while1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Scanner scanner = new Scanner(System.in);
		
		
		
		
		
		int numero = 0;
		int suma = 0; 
		do {
			System.out.println("Introduzca un número, para cerrar el programa escribe el 0");
			numero=scanner.nextInt();
			suma+= numero;
		
		} while (numero!=0);
			
			System.out.println("La suma total "+ suma );
			
		scanner.close();
		 
		
	}
}
