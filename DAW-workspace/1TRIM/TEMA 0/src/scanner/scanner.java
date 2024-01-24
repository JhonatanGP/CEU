package scanner;
import java.util.Scanner;
public class scanner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Dime tu nombre.");
		String nombre = scanner.nextLine();
		System.out.println("¡Perfecto!, ahora dime tu edad.");
		int edad = scanner.nextInt();
		System.out.println("¡Perfecto!, Encantado " + nombre + ", tienes " + edad + " años.");
		scanner.close();
		
	}

}
