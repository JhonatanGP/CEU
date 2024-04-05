package tema5;

import java.util.InputMismatchException;
import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

			try {
				SacoNumeros saco = new SacoNumeros();
				Integer numero = 0;
				do {
					try {
						System.out.println("Dame un número");
						numero = sc.nextInt();
						if (!numero.equals(-1)) {
							saco.addNumero(numero);
						}
					}
					catch(InputMismatchException e) {
						System.out.println("Sólo se admiten números");
						sc.nextLine();
					}
				} 
				while(!numero.equals(-1));
				System.out.println("Lista: " + saco);
				
				do {
					try {
						System.out.println("Dame una posición");
						numero = sc.nextInt();
						if (!numero.equals(-1)) {
							System.out.println("Lo que hay en esa posición es: " + saco.getNumero(numero));
						}
					}
					catch(InputMismatchException e) {
						System.out.println("Sólo se admiten números");
						sc.nextLine();
					}
				} 
				while(!numero.equals(-1));		
			}
			finally {
				sc.close();
				System.out.println("Scanner cerrado correctamente");
			}
		}

	}


