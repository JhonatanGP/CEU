import java.util.Scanner;

public class Prueba {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Indica un número ");
		int numero = scanner.nextInt();
		if ((numero>=5) && (numero<7)) {
			System.out.println("APROBADO");
		}
		else if ((numero >= 7) && (numero < 9)) {
			System.out.println("Notable");
		}
		else if ((numero >= 9) && (numero <= 10)) {
			System.out.println("Sobresaliente");
		}
		else {
			System.out.println("SUSPENSO");
			
		}
		scanner.close();

	}

}
