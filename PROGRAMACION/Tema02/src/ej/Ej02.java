package ej;

import java.util.Scanner;

public class Ej02 {
	
	public static final double IVA = 0.21;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("¿Cuál es su altura?");
		Float altura = sc.nextFloat();
		System.out.println("¿Y su peso?");
		Float peso = sc.nextFloat();
		Float imc = peso/(altura*altura);
		
		System.out.println("Su IMC es de  " + imc + ".");
		
		sc.close();
	}

}
