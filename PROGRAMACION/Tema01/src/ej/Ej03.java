package ej;

import java.util.Scanner;

public class Ej03 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("¿Cuántos años tienes?");
		Integer edad = sc.nextInt();
		System.out.println("Su edad es de " + edad + " años.");
				
		sc.close();
	}

}
