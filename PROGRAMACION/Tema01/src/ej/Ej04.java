package ej;

import java.util.Scanner;

public class Ej04 {
	public static final int AÑO_ACTUAL = 2024;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("Indique su año de nacimiento");
		Integer nac = sc.nextInt();
		Integer edad = AÑO_ACTUAL - nac;
		System.out.println("Su edad es de " + edad + " años.");
	
		sc.close();
	}

}
