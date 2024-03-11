package tarea1;

import java.util.Scanner;

public class tarea7 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Scanner scanner = new Scanner(System.in);
		
		
		System.out.println("Indique su altura");
		
		float altura = scanner.nextFloat();
		
		System.out.println("Indique su peso");
		
		float peso = scanner.nextFloat();
		scanner.close();
		
		double Calculo = peso /(altura*altura);
		
		System.out.println("Su índice de masa corporal es de"+" " + Calculo);
		
		
	}

}
