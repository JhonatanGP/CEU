package ej;

import java.util.Scanner;

public class Ej05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("¿Cuánto te gustaría ganar al año?");
		Long año = sc.nextLong();
		Long mes = año / 12 ;
		
		System.out.println("Tu sueldo mensual sería de " + mes + " euros al mes.");
		
		sc.close();

	}

}
