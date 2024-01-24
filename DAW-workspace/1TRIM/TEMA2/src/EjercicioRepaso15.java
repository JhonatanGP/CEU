import java.util.Scanner;
import java.util.Random;

public class EjercicioRepaso15 {

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		Random random = new Random();
		int numero = random.nextInt(0, 10);
		int numeroIntroducido = -1;
		int contador = 0;
		do {
			System.out.println("Adivina el número ");
			numeroIntroducido = scanner.nextInt();
			
			contador++;

		} while (numero != numeroIntroducido);
		System.out.println("Su puntuación es " + (10 - contador));
		
		scanner.close();

	}

}
