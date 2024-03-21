package repaso;

import java.util.Scanner;

public class repaso7 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		System.out.println("Escribe tu telegrama");
		String telegrama = scanner.nextLine();
		
		
		String[] mensaje= telegrama.split(" ");
		
		Integer contador=0;
		
		
		for(int i=0;i<mensaje.length;i++) {
			
			if(!mensaje[i].equals("STOP")){
				contador++;
			}
		
		}
		Double precio =contador * 0.24;
		
		System.out.println("El precio es de "+precio+ "€");
		scanner.close();	
	}

}

