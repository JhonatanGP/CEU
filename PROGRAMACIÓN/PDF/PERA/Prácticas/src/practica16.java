import java.util.Scanner;

public class practica16 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Escribe una palabra para descomponerla");
		
		String palabra=scanner.nextLine();
			 
		String letras="";
		
		for(int i=0; i <= palabra.length(); i++) {
			
			
			
			 if(i<palabra.length()) {
				 System.out.println(palabra.substring(i,i+1));
				
			 }else if(i==palabra.length()) {
				 System.out.println(palabra.substring(palabra.length()));
			 
			 }
			
		}
		
		
		
		scanner.close();
	}

}
