package For;

import java.util.Scanner;

public class for2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Escribe un número");
		
		int numero = scanner.nextInt();
		scanner.close();
		
		for(int contador=0;contador<=10;contador++ ) {
			Integer resultado= numero * contador;
			System.out.println(numero +"x" + contador+ "="+ resultado);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
