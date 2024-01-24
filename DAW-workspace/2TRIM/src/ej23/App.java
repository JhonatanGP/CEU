package ej23;

import java.util.Scanner;

public class App {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);	
		
		Profesor profesor = new Profesor();			

		System.out.println("Dime tu nombre");
		String nombre = scanner.nextLine();
		profesor.setNombre(nombre);
		
		System.out.println("Dime tu edad");
		Integer edad = scanner.nextInt();
		profesor.setEdad(edad);
		
		
		
		System.out.println("Nombre: " + profesor.getNombre());
		System.out.println("Edad: " + profesor.getEdad());
		
		System.out.println(profesor.toString());

		scanner.close();

	}

}
