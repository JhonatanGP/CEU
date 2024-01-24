package REPASO;
import java.util.Scanner;
public class Repaso10 {

	public static void main(String[] args) {
		Scanner scanner= new Scanner (System.in);
		System.out.println("¿Cuántos alumnos hay en clase?");
		Integer numAlum = scanner.nextInt();
		
		String []alum = new String [numAlum];
			System.out.println("¿Cuál es el nombre del alumno 1?");
			String alum1 = scanner.nextLine(); 
			System.out.println("Cuál es la nota de " + alum1 + " para el examen 1 ");
			Integer nota1 = scanner.nextInt();	
			
		
	}

}