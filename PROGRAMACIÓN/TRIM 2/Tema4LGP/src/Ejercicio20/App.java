package Ejercicio20;

import java.util.Scanner;

import Ejercicio18.Alumno;

public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);

		String dni = "";
		String nombre = "";
		Integer edad = 0;
		Double nota = 0.0;

		Alumno alumno2 = new Alumno();

		System.out.println("Dime tu edad");
		edad = scanner.nextInt();
		alumno2.setEdad(edad);

		scanner.nextLine();
		System.out.println("Dime tu nombre");
		nombre = scanner.nextLine();
		alumno2.setNombre(nombre);

		System.out.println("Dime tu nota");
		nota = scanner.nextDouble();
		alumno2.setNota(nota);

		scanner.nextLine();
		System.out.println("Dime tu dni");
		dni = scanner.nextLine();
		alumno2.setDni(dni);

		//alumno2.setDni();
		System.out.println();
		System.out.println("2Tu edad es " + alumno2.getEdad());
		System.out.println("2Tu dni es " + alumno2.getDni());
		System.out.println("2Tu nombre es " + alumno2.getNombre());
		System.out.println("2Tu nota es " + alumno2.getNota());

		alumno2.aprobar();
		System.out.println("La nueva nota: " + alumno2.getNota());

		scanner.close();
	}
}