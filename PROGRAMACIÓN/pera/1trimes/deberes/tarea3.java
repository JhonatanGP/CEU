package deberes;

import java.util.Scanner;

public class tarea3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Indique precio sin IVA");
	
		Integer precio = scanner.nextInt();
		
		scanner.nextLine();
		
		System.out.println("Indique el tipo de IVA");
		
		String Tipo_IVA = scanner.nextLine();
		
		scanner.close();
		
		double IVA = 0;
		
		
		if (Tipo_IVA.equals("Normal")) {
			IVA = 0.21;
		}
		
		else if (Tipo_IVA.equals("Reducido")) {
			IVA = 0.10;
		}
		
		else if ( Tipo_IVA.equals("Superreducido")) {
			IVA = 0.04;
		}
		
		else if (Tipo_IVA.equals("Exento")) {
			IVA = 0;
		}
		
		double IVA_Final = IVA * precio;
		double PrecioFin = precio + IVA_Final;
		
		
		System.out.println("Su precio sin IVA sería de"+ " "+ precio+ "€, su IVA sería de " +" "+ IVA_Final+ " "+ " y su precio final seía de"+ " "+ PrecioFin);
		
		
		
	}

}
