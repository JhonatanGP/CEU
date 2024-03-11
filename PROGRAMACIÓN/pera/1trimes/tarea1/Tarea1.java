package tarea1;

import java.util.Scanner;

public class Tarea1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Escribe tu nombre:");
		String mensaje = scanner.nextLine();
		
		System.out.println("Escrine tus apellidos");
		String apellidos = scanner.nextLine();
		
		System.out.println("indique tu edad");
		String edad = scanner.nextLine();
		
		scanner.close();
		System.out.println("Tu nombre es"+ " " + mensaje + " " + ", tu apellido" + " " + apellidos + "y tu edad es" + " " + edad);
		
		
		
		
		
		
		
		
		
		
	}

}
