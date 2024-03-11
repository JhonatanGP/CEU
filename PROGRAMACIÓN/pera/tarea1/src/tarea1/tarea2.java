package tarea1;

import java.util.Scanner;

public class tarea2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner (System.in);
		System.out.println("Indica tu nombre:");
		
		String nombre = scanner.nextLine();
		
		
		System.out.println("Bienvenido" +" " + nombre);
		
		System.out.println("¿De dónde eres?");
		
		String vivienda = scanner.nextLine();
		
		System.out.println("¿Como se vive en" + " " + vivienda + "?");
		
		String pregunta = scanner.nextLine();
		
		
		System.out.println("Gracias, un saludo");
		scanner.close();
	}

}
