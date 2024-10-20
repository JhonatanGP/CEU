package Ejercicio30;

import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);

		Alumno[] alumnos = new Alumno[3];
		Curso curso = new Curso(2);

		for (int i = 0; i < alumnos.length; i++) {
			Alumno a = new Alumno();

			System.out.println("Dime tu nombre");
			String nombre = scanner.nextLine();

			System.out.println("Dime tu edad");
			Integer edad = scanner.nextInt();

			System.out.println("Dime tu nota");
			Double nota = scanner.nextDouble();
			scanner.nextLine();

			System.out.println("Dime tu dni");
			String dni = scanner.nextLine();

			a.setNombe(nombre);
			a.setEdad(edad);
			a.setNota(nota);
			a.setDni(dni);
			alumnos[i] = a;
			curso.addAlumno(a);
		}

		scanner.close();
	}
}