package ej24;

import java.util.Scanner;

public class App {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);	
		
		Profesor profesor = new Profesor();			

		System.out.println("Dime el nombre del profesor");
		String nombre = scanner.nextLine();
		profesor.setNombre(nombre);
		
		System.out.println("Dime su edad");
		Integer edad = scanner.nextInt();
		scanner.nextLine();
		profesor.setEdad(edad);
		
		System.out.println("Nombre: " + profesor.getNombre());
		System.out.println("Edad: " + profesor.getEdad());
		
		System.out.println(profesor.toString());
		
		System.out.println();	
		
		Alumno alumno = new Alumno();

		System.out.println("Dime el nombre del alumno");
		nombre = scanner.nextLine();
		alumno.setNombre(nombre);
		
		System.out.println("Dime su edad");
		edad = scanner.nextInt();
		scanner.nextLine();
		alumno.setEdad(edad);
		
		System.out.println("Nombre: " + alumno.getNombre());
		System.out.println("Edad: " + alumno.getEdad());
		
		System.out.println(alumno.toString());

		scanner.close();

	}

}
