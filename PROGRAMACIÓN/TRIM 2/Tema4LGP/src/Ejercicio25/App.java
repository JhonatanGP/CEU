package Ejercicio25;

import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);

		Alumno[] alumnos = new Alumno[3];
		// Curso curso = new Curso();

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
		}
		
		if(alumnos[0].equals(alumnos[1]) 
				||alumnos[1].equals(alumnos[2])
				||alumnos[0].equals(alumnos[2])){
			System.out.println("Hay alumnos con dni repetidos");
		}

		scanner.close();
	}
}