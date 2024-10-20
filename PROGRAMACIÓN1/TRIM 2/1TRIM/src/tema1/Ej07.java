package tema1;

import java.text.DecimalFormat;
import java.util.Scanner;

public class Ej07 {

	public static void main(String[] args) {
//Realizar un programa que calcule el IMC (índice de masa corporal). Para ello:
		
	//1. Solicita por consola al usuario cuál es su altura y su peso (en dos pasos)
		System.out.println("¿Cuál es tu altura?");
		Scanner sc = new Scanner(System.in);
		Double altura = sc.nextDouble();
		System.out.println("¿Y tu peso?");
		Double peso = sc.nextDouble();
	//2. Recoge los datos y calcula el IMC
		Double imc = peso/(altura*altura);
		System.out.println("Tu IMC es " + imc );
	//3. Muestra por consola el resultado del IMC calculado y redondeado
		DecimalFormat df = new DecimalFormat("0.00");
		System.out.println("Tu IMC redondeado es " + df.format(imc));
		
	}

}
