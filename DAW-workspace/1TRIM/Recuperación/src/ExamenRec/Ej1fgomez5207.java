package ExamenRec;

import java.util.Scanner;

public class Ej1fgomez5207 {

	public static void main(String[] args) {
		String palabra1;
		String palabra2;
		Scanner sc = new Scanner(System.in);
		do {
			System.out.println("Dame una palabra que no sea vacía");
			palabra1 = sc.nextLine();
		} while (palabra1.isEmpty());

		do {
			System.out.println("Ahora dame una segunda palabra que tenga la misma longitud que la primera");
			palabra2 = sc.nextLine();
		} while (palabra2.length() != palabra1.length());

		String[] fusion = new String[palabra1.length()];

		String[] fusion2 = new String[palabra2.length()];

		for (int i = 0; i < fusion.length; i++) {

		}

		for (int j = 0; j < fusion2.length; j++) {

		}

	}

}
