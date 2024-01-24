import java.util.Scanner;

public class Ejercicio3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		System.out.println("¡Hola!¿Qué edad tienes?");
		Integer edad = scanner.nextInt();
		System.out.println("De acuerdo, su edad es" + " " + edad +  " años.");
		scanner.close();
	}

}
