package tema1;

import java.util.Scanner;

public class Ej03 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		//1. Mostrar un mensaje pidiendo la edad del usuario
		System.out.println("¿Qué edad tienes?");
		//2. Esperar a que el usuario escriba su edad y almacenarla en una variable
		Integer edad = sc.nextInt();
		//3. Mostrar un nuevo mensaje indicando “Su edad es de xx años” 
		System.out.println("Su edad es " + edad + " años.");
		
		sc.close();

	}

}
