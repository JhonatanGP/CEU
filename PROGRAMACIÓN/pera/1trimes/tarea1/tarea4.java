package tarea1;

import java.util.Scanner;

public class tarea4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		System.out.println("Indique su fecha de nacimiento:");
		
		int año = scanner.nextInt();
		
		
		scanner.close();
		
		int Edad = 2023- año;
		
		System.out.println("Su edad actual es de "+Edad+" años");

		
		
	}

}
