package ExamenRec;

import java.util.Scanner;

public class Ej3fgomez5207 {

	public static void main(String[] args) {
		System.out.println("Dame un numero mayor que cero");
		Scanner sc = new Scanner(System.in);
		Integer numero = sc.nextInt();
		for (Integer cosa1 = 0; cosa1 <= numero - 1; cosa1++) {
			for (Integer cosa2 = 0; cosa2 <= numero - 1; cosa2++) {
				if (cosa1 == cosa2) {
					System.out.print("o ");
				} else {
					System.out.print("* ");
				}
			}
			System.out.println();
		}
	}
}
