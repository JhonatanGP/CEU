package EJ24;

import java.util.Scanner;

public class AppProfesor {
		public static void main(String[] args) {
			
			Scanner scanner = new Scanner(System.in);
			
			Profesor profesor = new Profesor();
			
			System.out.println("Dime el nombre");
			String nombre = scanner.nextLine();
			profesor.setNombre(nombre);
			
			System.out.println("Dime la edad");
			Integer edad = scanner.nextInt();
			profesor.setEdad(edad);
			
			System.out.println(profesor);
					
			scanner.close();		
			
		}
	}

