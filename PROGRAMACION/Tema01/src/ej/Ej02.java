package ej;

import java.util.Scanner;

public class Ej02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("Indique su nombre por favor:");
		String nombre = sc.nextLine();
		
		System.out.println("Bienvenido " + nombre + ".");
		System.out.println("¿De dónde eres?");
		String lugar = sc.nextLine();
		
		System.out.println("¿Qué tal se vive en " + lugar + "?");
		String resp = sc.nextLine();
				
		System.out.println("Gracias. Saludos.");
		
		sc.close();
	}

}
