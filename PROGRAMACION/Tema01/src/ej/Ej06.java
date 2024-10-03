package ej;

import java.util.Scanner;

public class Ej06 {
	
	public static final double IVA = 0.21;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("¿Cuál es el precio sin IVA?");
		Double sinIVA = sc.nextDouble();
		Double iva = sinIVA * IVA;
		Double conIVA = sinIVA + iva;
		
		System.out.println("El IVA del producto es " + iva +
				" euros, y el precio con IVA es " + conIVA + " euros.");
		
		sc.close();
	}

}
