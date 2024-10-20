package tema1;

import java.util.Scanner;

public class Ej02 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		//1. Mostrar un mensaje pidiendo el nombre del usuario
		System.out.println("Dime tu nombre de usuario");
		//2. Esperar a que el usuario escriba su nombre
		String nombre = sc.nextLine();
		//3. Mostrar un nuevo mensaje indicando: “Bienvenido (nombre)”
		System.out.println("Bienvenido " + nombre);
		//4. Mostrar un nuevo mensaje indicando: “¿De dónde eres?”
		System.out.println("¿De dónde eres?");
		//5. Esperar a que el usuario escriba el lugar de donde vive
		String lugar = sc.nextLine();
		//6. Mostrar un mensaje preguntando: “¿Qué tal se vive en (localidad)?”
		System.out.println("¿Qué tal se vive en " + lugar + "?");
		//7. Esperar a que el usuario escriba una respuesta
		String resp = sc.next();
		//8. Mostrar un último mensaje indicando “Gracias. Un saludo”
		System.out.println("Gracias. un saludo");
		
		sc.close();

	}

}
