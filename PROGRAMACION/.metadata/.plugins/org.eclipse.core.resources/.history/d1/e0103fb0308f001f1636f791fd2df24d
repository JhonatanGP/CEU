package ej03PrácticosRepaso;

import java.util.Scanner;

public class Ej12 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Boolean v = true;

		do {
			System.out.println("Escriba un número mayor que cero:");
			Integer n = sc.nextInt();

			if (n <= 0) {
				System.out.println("El número ingresado no es válido.");
				v = true;

			} else {
				for (int i = 0; i < 1; i++) {
					System.out.print(" ");
					for (int y = 0; y < n; y++) {
						if (y == n - 1) {
							System.out.print("__");
						} else {
							System.out.print("___");
						}
					}
				}
				for (int i = 0; i < n; i++) {
					System.out.println();
					System.out.print("|");
					for (int y = 0; y < n; y++) {
						System.out.print("__|");
						
					}
				}
				v = false;
			}

		} while (v);

		sc.close();
	}
}
