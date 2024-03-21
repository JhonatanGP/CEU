package EJ24;

import java.util.Scanner;

public class AppAlumno {
	
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Dime el dni");
		String dni = scanner.nextLine();
		Alumno alumno = new Alumno(dni);
		Alumno alumno2 = new Alumno(dni);		

		Alumno alumno3 = new Alumno(dni);

		if(alumno3.equals(alumno2)) {
			
			System.out.println("los dos alumnos son iguales");
		}
		else
			System.out.println("los dos alumnos no son iguales");
		
		
		
		alumno2 = alumno3;
		
		if(alumno3.equals(alumno2)) {
			
			System.out.println("los dos alumnos son iguales");
		}
		else
			System.out.println("los dos alumnos no son iguales");
		
		System.out.println("Dime el nombre");
		String nombre = scanner.nextLine();
		alumno.setNombre(nombre);
		
		System.out.println("Dime la edad");
		Integer edad = scanner.nextInt();
		alumno.setEdad(edad);
		System.out.println("Dime la nota");
		Double nota = scanner.nextDouble();
		alumno.setNota(nota);
		
		Curso curso = new Curso();
		System.out.println("Dime el id del curso");
		Long idCurso = scanner.nextLong();
		scanner.nextLine();
		System.out.println("Dime la descripcin del curso");
		String descCurso = scanner.nextLine();
		
		curso.setDescripcion(descCurso);
		curso.setIdentificador(idCurso);
		
		alumno.setCurso(curso);
		
		System.out.println(alumno);
		//System.out.println(alumno.toString());
		
		alumno.aprobar();
		
		System.out.println("Nueva NOTA: " + alumno.getNota());
		
		scanner.close();		
		
	}
}

