import java.util.Scanner;

public class Ejercicio5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		System.out.println(" ¿Cuánto te gustaría ganar al año?");
		Integer cantidad = scanner.nextInt();
		System.out.println(" Ok, tu sueldo mensual sería de " + cantidad / 12 + " euros.");
		scanner.close();

	}
	
}
