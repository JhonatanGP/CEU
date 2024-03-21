package tarea1;

import java.util.Scanner;

public class tarea6 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Indique un precio de un producto sin IVA");
		
		double IVA = scanner.nextDouble();
		scanner.close();
		double Calculo = IVA * 0.21;
		double Final = Calculo + IVA;
		
		
		System.out.println("El precio sin el IVA es"+ " "+ IVA +" "+"y con el IVA"+ " "+ Calculo+ " " + "y su precio final es"+" "+Final);
		
		
		
	}

}
