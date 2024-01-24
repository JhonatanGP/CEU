package ej22;

import java.util.Scanner;

public class App {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);	
		
		System.out.println("Dime tu dni");
		String dni = scanner.nextLine();
		Alumno alumno = new Alumno(dni);			

		System.out.println("Dime tu nombre");
		String nombre = scanner.nextLine();
		alumno.setNombre(nombre);
		
		System.out.println("Dime tu edad");
		Integer edad = scanner.nextInt();
		alumno.setEdad(edad);
		
		System.out.println("Dime tu nota");
		Double nota = scanner.nextDouble();
		alumno.setNota(nota);
		
		Curso curso = new Curso();
		System.out.println("Dime el id del curso");
		Long idCurso = scanner.nextLong(); scanner.nextLine(); //desp de pedir un nº y desp quieres una letra, debes poner un scaner primero para el nº y luego para la letra
		System.out.println("Dime la descripsion del curso");
		String descCurso = scanner.nextLine();
		curso.setDescripcion(descCurso);
		curso.setIdentificador(idCurso);
		alumno.setCurso(curso);
		
		System.out.println("DNI: " + alumno.getDni());
		System.out.println("Nombre: " + alumno.getNombre());
		System.out.println("Edad: " + alumno.getEdad());
		System.out.println("Nota: " + alumno.getNota());

		alumno.aprobar();
		System.out.println("Nueva nota: " + alumno.getNota());
		
		System.out.println(alumno.getNombre());
		System.out.println(alumno.getCurso().getDescripcion());
		System.out.println(alumno.getCurso().getIdentificador());
		System.out.println(alumno.getCurso());
		System.out.println("**************");
		System.out.println(alumno);

		scanner.close();

	}

}
