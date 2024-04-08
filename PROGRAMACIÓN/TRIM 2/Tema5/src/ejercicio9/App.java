package ejercicio9;

import java.util.Scanner;

import ejercicio7.Sociedad;

public class App {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Sociedad sociedad = new Sociedad();
		try {
			while (true) {
				obtenerPersona(sc, sociedad);
				System.out.println("¿Quieres otra persona? (S/N)");
				String valor = sc.nextLine();
				if (valor.equalsIgnoreCase("n")) {
					break;
				}
			}
		}

		
	}

	private static void obtenerPersona(Scanner sc, Sociedad sociedad) {
		// TODO Auto-generated method stub
		
	}

}
