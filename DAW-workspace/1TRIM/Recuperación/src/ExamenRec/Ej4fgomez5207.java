package ExamenRec;

import java.util.Random;
import java.util.Scanner;

public class Ej4fgomez5207 {

	@SuppressWarnings("unused")
	public static void main(String[] args) {
		String palabra;
		Scanner sc = new Scanner(System.in);
		do {
			System.out.println("Dame una palabra que tenga más de 7 letras");
			palabra = sc.nextLine();

		} while (palabra.length() <= 7);

		Integer numero;

		do {
			System.out.println("Ahora dame un número que sea mayor que el tamaño de la palabra asignada");
			numero = sc.nextInt();
		} while (numero <= palabra.length());

		Integer[] tamaño = new Integer[10];

		for (int i = 0; i < tamaño.length; i++) {
			Random random = new Random();
			Integer aleatorio = random.nextInt(1, numero);
			tamaño[i] = aleatorio;

			System.out.print(tamaño[i] + " ");

		}

		for (int i = 0; i < tamaño.length; i++) {
			if (tamaño[i] < palabra.length()) {
				System.out.println("Número mayor que no supera el tamaño de la palabra: " + tamaño[i]);
				break;
			}

			else {
				System.out.println("No hay ningún número que no supere el tamaño de la palabra");
				break;
			}

		}
	}

}
