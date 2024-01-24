package ej26;

import java.util.Scanner;

public class App {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);	
		
		Curso curso = new Curso();	
		curso.setIdentificador(01L);
		curso.setDescripcion("DAM/DAW");

		Alumno[] alumnos = new Alumno[3];
		for (int i = 0; i<alumnos.length; i ++) {
			System.out.println("Dime el dni");
			String dni = scanner.nextLine();
			Alumno alumno = new Alumno(dni);
			System.out.println("Dime el nombre ");
			String nombre = scanner.nextLine();
			alumno.setNombre(nombre);
			System.out.println("Dime su edad");
			Integer edad = scanner.nextInt();
			alumno.setEdad(edad);
			System.out.println("Dime la nota");
			Double nota = scanner.nextDouble(); 
			scanner.nextLine();
			alumno.setNota(nota);
			alumno.setCurso(curso);
			alumnos [i] = alumno;
		}
	
		for (Alumno alumno:alumnos) {
			System.out.println(alumno);
		}
		
		if (alumnos[0].equals(alumnos[1])
			|| alumnos[0].equals(alumnos[2])
			|| alumnos[1].equals(alumnos[2])) {
			System.err.println("Error: Hay  al menos 2 alumnos repetidos");
		}
		else {
			System.out.println("Felicidades: Todos los alumnos son distintos");
		}

		scanner.close();
		 			
	}

}
