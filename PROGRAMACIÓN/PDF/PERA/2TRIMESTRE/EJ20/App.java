package EJ20;

import java.util.Scanner;

public class App {
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Dime el dni");
		String dni = scanner.nextLine();
		Alumno alumno = new Alumno(dni);
		
		System.out.println("Dime el nombre");
		String nombre = scanner.nextLine();
		alumno.setNombre(nombre);
		
		System.out.println("Dime la edad");
		Integer edad = scanner.nextInt();
		alumno.setEdad(edad);
		System.out.println("Dime la nota");
		Double nota = scanner.nextDouble();
		alumno.setNota(nota);
		
		
		System.out.println("DNI: " + alumno.getDni());
		System.out.println("NOMBRE: " + alumno.getNombre());
		System.out.println("EDAD: " + alumno.getEdad());
		System.out.println("NOTA: " + alumno.getNota());
		
		
		alumno.aprobar();
		
		System.out.println("Nueva NOTA: " + alumno.getNota());
		
		scanner.close();
		
	}
}

