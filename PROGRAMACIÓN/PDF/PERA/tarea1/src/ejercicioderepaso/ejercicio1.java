package ejercicioderepaso;

import java.util.Scanner;

public class ejercicio1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Indique el radio de una circunferencia");
		
		
		double Radio = scanner.nextDouble();
		
		scanner.close();
		
		Double pi = Math.PI;
		
		double circunferencia= 2 + pi * Radio;
		double Area = pi /(Radio * Radio);
		
		
		System.out.println("El are es"+ " "+ Area + " "+"y la circunferencia es"+ " "+circunferencia);
		
		
		
	}
}
