package For;

import java.util.Scanner;

public class for3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		
		Integer contador=0;
		System.out.println("Escriba un número");
		Integer numero = scanner.nextInt();
		
		
		scanner.close();
		while (contador<=10){
			
			Integer resultado= numero*contador;
			
			System.out.println(numero+ "x"+ contador+ "="+ resultado);
			
			contador++;
		}
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
