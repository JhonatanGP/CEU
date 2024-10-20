package Ejercicio18;

import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);

		Alumno alumno = new Alumno();

		System.out.println("Dime tu edad");
		Integer edad = scanner.nextInt();
		alumno.setEdad(edad);

		scanner.nextLine();
		System.out.println("Dime tu nombre");
		String nombre = scanner.nextLine();
		alumno.setNombre(nombre);

		System.out.println("Dime tu nota");
		Double nota = scanner.nextDouble();
		alumno.setNota(nota);

		scanner.nextLine();
		System.out.println("Dime tu dni");
		String dni = scanner.nextLine();
		alumno.setDni(dni);


		System.out.println("Tu edad es " + alumno.getEdad());
	 	System.out.println("Tu dni es " + alumno.getDni());
		System.out.println("Tu nombre es " + alumno.getNombre());
		System.out.println("Tu nota es " + alumno.getNota());

		scanner.close();
		
		Alumno alumno2 = new Alumno(dni, nombre, edad, nota);
		System.out.println();
		System.out.println("2Tu edad es " + alumno2.getEdad());
		System.out.println("2Tu dni es " + alumno2.getDni());
		System.out.println("2Tu nombre es " + alumno2.getNombre());
		System.out.println("2Tu nota es " + alumno2.getNota());
	}
}