package For;

import java.util.Scanner;

public class for5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		String nombre;
		
		Scanner scanner = new Scanner(System.in);
		
		
		System.out.println("Escribe tu nombre");
		
		nombre = scanner.nextLine();
		
		scanner.close();
		
		
		
			for(int contador=0;contador<=5;contador++ ) {
				System.out.println("Tu nombre es = "+ nombre);
					 
		}
			

	}

}
