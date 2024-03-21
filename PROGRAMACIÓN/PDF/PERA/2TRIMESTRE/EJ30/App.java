package EJ30;

import java.util.Scanner;

import EJ23.Profesor;


public class App {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		Curso curso = new Curso(3);
		curso.setIdentificador(1L);
		curso.setDescripcion("DAM/DAW");

		Alumno[] alumnos = new Alumno[3];
		for (int i = 0; i < alumnos.length; i++) {
			Alumno alumno = null;
			Boolean dniCorrecto = false;
			do {
				System.out.println("Dime el dni");
				String dni = scanner.nextLine();
				alumno = new Alumno(dni);
				if (!alumno.validarDNI()) {
					System.err.println("Dni no vlido");
				}
				else {
					dniCorrecto = true;
				}
			}while(!dniCorrecto);
			
			System.out.println("Dime el nombre");
			String nombre = scanner.nextLine();
			alumno.setNombre(nombre);
			System.out.println("Dime la edad");
			Integer edad = scanner.nextInt();
			alumno.setEdad(edad);
			System.out.println("Dime la nota");
			Double nota = scanner.nextDouble();
			scanner.nextLine();
			alumno.setNota(nota);
			alumno.setCurso(curso);
			alumnos[i] = alumno;
			curso.addAlumno(alumno);
		}		
		
		for (Alumno alumno : alumnos) {
			System.out.println(alumno);
		}
		
		if (alumnos[0].equals(alumnos[1]) 
				|| alumnos[0].equals(alumnos[2])
				|| alumnos[1].equals(alumnos[2])) {
			System.err.println("Error: hay al menos 2 alumnos repetidos");
		}
		else {
			System.out.println("Felicidades: todos los alumnos son distintos!!");
		}
		
		for (Alumno alumno : alumnos) {
			if (!alumno.validar()) {
				System.err.println("Alumno incorrecto con DNI: " + alumno.getDni());
			}
		}
		scanner.close();
	}
}

