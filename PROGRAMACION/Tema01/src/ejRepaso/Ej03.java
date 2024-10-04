package ejRepaso;

import java.util.Scanner;

public class Ej03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("Introduce un número:");
		String a1 = sc.nextLine();
		System.out.println("Introduce otro número:");
		String a2 = sc.nextLine();
		
		// Para operar necesito pasar de string a Long 
		Long n1 = Long.parseLong(a1);
		Long n2 = Long.parseLong(a2);
		Long n3 = n1 * n2;
		System.out.println("El resultado de la multiplicación de " + n1 + " x " + n2 + " es: " + n3 + ".");
	
		sc.close();
	}

}
