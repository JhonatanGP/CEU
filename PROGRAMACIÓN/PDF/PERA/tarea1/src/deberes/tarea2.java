package deberes;

import java.util.Scanner;

public class tarea2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
Scanner scanner = new Scanner(System.in);
		
		System.out.println("Indique su peso");
	
		Integer peso = scanner.nextInt();
		
		scanner.close();
		
		if (peso<18.5) {
			
			System.out.println("Tienes un peso inferioir a lo normal");
		}
		
		else if (peso>=18.5 && peso<=24.9) {
			System.out.println("Tienes un peso corporal normal");
		}
		
		else if (peso>=25 && peso<=29.9) {
			System.out.println("Tu peso es superior al normal");
		}
		
		else {
			System.out.println("Tienes obesidad");
		}
		
		
		
		
		
		
		
		
		
		
	}

}
