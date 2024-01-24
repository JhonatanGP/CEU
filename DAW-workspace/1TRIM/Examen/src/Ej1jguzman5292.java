import java.util.Scanner;

public class Ej1jguzman5292 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Escriba una palabra que contenga la letra M o m");
		String palabra =scanner.nextLine();
		Boolean contienem = palabra.contains("m"); 
		Boolean contieneM = palabra.contains("M");
		String may = palabra.toUpperCase();
		String minu = palabra.toLowerCase();
		do {
			System.out.println("Escriba una palabra que contenga la letra M o m");
			palabra = scanner.nextLine();
		
		if (palabra.contains("m")|| palabra.contains("M"))
			System.out.println("La palabra indicada no contiene la letra M o m.");
		
		} while (!palabra.contains("m")|| palabra.contains("M"));
		System.out.println("Nueva palabra: ");
		
		scanner.close();
	   
	}

}
