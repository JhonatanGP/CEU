package tarea1;

import java.util.Scanner;

public class tarea5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		
		System.out.println("¿Cuánto te gustaría ganar al año?");
		
		int dinero = scanner.nextInt();
		
		scanner.close();
		
		int media = dinero/12;
		
		System.out.println("Tu sueldo mensual sería de"+" "+ media);
	}

}
