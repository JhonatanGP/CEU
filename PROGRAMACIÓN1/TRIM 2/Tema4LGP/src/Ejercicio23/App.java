package Ejercicio23;

import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		
		Profesor profesor1 = new Profesor();

		
		System.out.println("Dime tu edad");
		Integer edad = scanner.nextInt();
		profesor1.setEdad(edad);

		scanner.nextLine();
		System.out.println("Dime tu nombre");
		String nombre = scanner.nextLine();
		profesor1.setNombe(nombre);
		
		System.out.println("Tu edad es " + profesor1.getEdad());
		System.out.println("Tu nombre es " + profesor1.getNombe());

		System.out.println(profesor1);
		
		scanner.close();
	}
}