package ejRepaso;

import java.util.Scanner;

public class Ej02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("Introduce un número:");
		Long n1 = sc.nextLong();
		System.out.println("Introduce otro número:");
		Long n2 = sc.nextLong();
		Long n3 = n1 * n2;
		System.out.println("El resultado de la multiplicación de " + n1 + " x " + n2 + " es: " + n3 + ".");
		
		sc.close();
	
	}

}
