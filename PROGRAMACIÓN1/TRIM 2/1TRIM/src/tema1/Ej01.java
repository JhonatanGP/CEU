package tema1;

import java.util.Scanner;

public class Ej01 {

	public static void main(String[] args) {
		Scanner sc = new Scanner (System.in);
		//1. Mostrar un mensaje pidiendo el nombre del usuario
		System.out.println("Dime tu nombre");
		//2. Esperar a que el usuario escriba su nombre y registrarlo en una variable
		String nombre = sc.nextLine();
		//3. Mostrar un nuevo mensaje pidiendo el apellido del usuario
		System.out.println("Dime tus apellidos");
		//4. Esperar a que el usuario escriba su apellido y registrarlo en otra variable
		String apellidos = sc.nextLine();
		//5. Mostrar un mensaje final indicando: "Su nombre completo es ... (nombre y apellido)"
		System.out.println("Tu nombre completo es: " + nombre + " " + apellidos);
		
		sc.close();
	}

}
