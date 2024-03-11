package switchCase;

import java.util.Scanner;

public class switchCase2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		

		
		Double IVA=0.0;
		
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("Indique un precio sin IVA");
		Integer precio= scanner.nextInt();
		scanner.nextLine();
		System.out.println("Indique el tipo de IVA");
		String iva= scanner.nextLine();
		
		
		scanner.close();
		
		
		switch (iva) {
		case "Normal":
			IVA=0.21; 
			break; 
			 	
		}
		switch (iva) {
		case "Reducido":
			IVA=0.10; 
			break; 
			 	
		}
		switch (iva) {
		case "Superreducido":
			IVA=0.04; 
			break; 
			 	
		}
		switch (iva) {
		case "Exento":
			IVA=0.0; 
			break; 
			
		default:
			System.out.println("Escribe la primera en mayúscula y sin faltas");
		 	
		}
		
		Double ResultadoIva= precio*IVA;
		Double Resultadofinal= ResultadoIva + precio;
		
		System.out.println("Su precio inicial es de "+ precio+", Su IVA sería de "+ ResultadoIva +", y su precio final es de "+ Resultadofinal);
	}

}
