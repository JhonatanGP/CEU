package test;

import java.util.Scanner;

public class MiScanner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		Scanner scanner = new Scanner (System.in);
		System.out.println("Dame tu nombre porfavor:");
		//voy a recuperar el nombre
		String nombre = scanner.nextLine();
		System.out.println("valor introducido: " + nombre);
		scanner.close();
		
		

	}

}
