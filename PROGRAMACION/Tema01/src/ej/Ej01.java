package ej;

import java.util.Scanner;

public class Ej01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("Indique su nombre por favor:");
		String nombre = sc.nextLine();
		
		System.out.println("Ahora indique sus apellidos por favor:");
		String apellidos = sc.nextLine();
		
		System.out.println("Su nombre completo es: " + nombre + " " + apellidos + ".");
		
		sc.close();
	}

}
