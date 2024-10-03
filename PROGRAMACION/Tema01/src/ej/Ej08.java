package ej;

import java.util.Scanner;

public class Ej08 {
	
	public static final double IVA = 0.21;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("Número guardado como String:");
		String a = sc.nextLine();
		
		System.out.println("Número decimal guardo como Double:");
		Double b = sc.nextDouble();
		
		System.out.println("Número entero guardado como Float:");
		Float c = sc.nextFloat();
		
		//Conversion de string a long "x1"
		Long x1 = Long.parseLong(a);
		
		//Conversion de double a string "x2"
		String x2 = b.toString();
		
		//Conversion de double a integer "x3"
		Integer x3 = b.intValue();
		
		//Conversion de float a long "x4"
		Long x4 = c.longValue();
		
		System.out.println("Valor de x1:" + x1 + "\nValor de x2:" + x2 + "\nValor de x3:" + x3 + "\nValor de x4:" + x4);

		sc.close();
	}

}
