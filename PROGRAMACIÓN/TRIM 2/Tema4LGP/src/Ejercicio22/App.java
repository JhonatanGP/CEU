package Ejercicio22;
import java.util.Scanner;

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
		alumno2.setNombe(nombre);

		System.out.println("Dime tu nota");
		nota = scanner.nextDouble();
		alumno2.setNota(nota);

		scanner.nextLine();
		System.out.println("Dime tu dni");
		dni = scanner.nextLine();
		alumno2.setDni(dni);

		//alumno2.setDni();
		System.out.println();
		System.out.println("Tu edad es " + alumno2.getEdad());
		System.out.println("Tu dni es " + alumno2.getDni());
		System.out.println("Tu nombre es " + alumno2.getNombe());
		System.out.println("Tu nota es " + alumno2.getNota());

		alumno2.aprobar();
		System.out.println("La nueva nota: " + alumno2.getNota());
		
		Curso curso = new Curso();
		System.out.println("Dime el id del curso");
		Integer identificadorC = scanner.nextInt();
		curso.setIdentificador(identificadorC);
		
		scanner.nextLine();
		System.out.println("Dime la descripcion del curso");
		String descripcionC = scanner.nextLine();
		curso.setDescripcion(descripcionC);
		
		System.out.println("El identificador del curso es: " + curso.getIdentificador());
		System.out.println("La descripcion del curso es: " + curso.getDescripcion());
		
		alumno2.setCurso(curso);
		
		System.out.println("----------");
		System.out.println(alumno2);
		
		
		
		
		
		scanner.close();
	}
}