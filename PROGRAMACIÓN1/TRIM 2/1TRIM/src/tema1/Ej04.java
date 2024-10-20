package tema1;

import java.util.Scanner;

public class Ej04 {

	public static void main(String[] args) {
//1. Mostrar un mensaje pidiendo el año de nacimiento del usuario.
		System.out.println("Dime tu año de nacimiento");
//2. Esperar a que el usuario conteste.
		Scanner sc = new Scanner(System.in);
		Integer fecha = sc.nextInt();
//3. Mostrar un nuevo mensaje indicando la edad del usuario calculada restando el año actual al año indicado por el usuario.
		Integer ano = 2024-fecha;
		System.out.println("Tu edad es: " + ano + " " + "años.");
		
		sc.close();

	}

}
