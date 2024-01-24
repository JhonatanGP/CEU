package ExamenRec;

import java.util.Scanner;

public class Ej2fgomez5207 {

	public static void main(String[] args) {
		Integer saldo;
		String respuesta;
		Scanner sc = new Scanner(System.in);
		do {
			System.out.println("¿Cuántas letras quieres comprar?");
			saldo = sc.nextInt();
		} while (saldo < 0);

		String mensaje;

		do {
			System.out.println("¿Qué mensaje quieres enviar?");
			mensaje = sc.nextLine();
			sc.nextLine();

			if (mensaje.length() <= saldo) {
				System.out.println("Enviado!!");


				saldo = saldo - mensaje.length();
				System.out.println("Saldo restante: " + saldo);

				System.out.println("¿Quieres enviar otro mensaje?");
				respuesta = sc.nextLine();

				if (respuesta.equalsIgnoreCase("FIN") || saldo == 0) {
					System.out.println("Saldo final: " + saldo);
					break;
				}
			}
			
				if (mensaje.length() > saldo) {
				
				System.out.println("Saldo insuficiente, inténtelo de nuevo:");
				System.out.println("¿Qué mensaje quieres enviar?");
				mensaje = sc.nextLine();
			}
			
		} while (saldo > 0);


	}
}
