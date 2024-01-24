import java.util.Scanner;

public class Ejercicio08 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String palabra1;
		String palabra2;
		
		do {
			System.out.println("Introduzca la primera palabra: ");
			palabra1 = scanner.nextLine();
			palabra1 = palabra1.trim();
			System.out.println("Introduce la segunda palabra: ");
			
			palabra2 = scanner.nextLine();
			palabra2 =palabra2.trim();
			
			if(!palabra1.equalsIgnoreCase(palabra2))
				System.out.println("Las palabras " + palabra1 + " y " + palabra2 + " son distintos");
			
		}while(!palabra1.equalsIgnoreCase(palabra2));
		
		System.out.println("Las palabras " + palabra1 + " y " + palabra2 + " " + "son iguales. HASTA LUEGO!");
		scanner.close();
	   }
	}