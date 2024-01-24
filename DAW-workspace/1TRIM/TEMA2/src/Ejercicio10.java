import java.util.Scanner;

public class Ejercicio10 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		String nombre1, nombre2 ;
				
		do {
			System.out.println("Introduzca la frase1: ");
			cad1 = scanner.nextLine();
			cad1 = cad1.trim();
			System.out.println("Introduce la frase2: ");
			
			cad2 = scanner.nextLine();
			cad2 =cad2.trim();
			
			if(!cad1.equalsIgnoreCase(cad2))
				System.out.println("Las palabras " + cad1 + " y " + cad2 + " son distintos");
			
		}while (nombre1.isBlank() || nombre2.isBlank());
		
		int comparacion = nombre1.compareTo(nombre2);
		if (comparacion <= 0) {
			System.out.println("Orden correcto: " nombre);
		}
		
		System.out.println(".");
		scanner.close();
	}

}
