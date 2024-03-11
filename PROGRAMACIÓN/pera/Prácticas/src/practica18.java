import java.util.Scanner;

public class practica18 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		 Scanner scanner = new Scanner(System.in);

	        System.out.print("Por favor, ingrese una palabra: ");
	        String palabra = scanner.nextLine();
		
	        Integer longitudpalabra = palabra.length();
		
		
	
			
			
			for (int i=0;i<longitudpalabra;i--) {
				String posicionletra = palabra.substring(longitudpalabra-1,longitudpalabra);
				
				
				
			}
			
		scanner.close();	
			
	
		
	}

}
