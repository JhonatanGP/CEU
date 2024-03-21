package Arrays;

import java.util.Scanner;

public class arrays6 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		String[] palabras = new String[3];
		Scanner scanner = new Scanner(System.in);


        for (int i = 0; i <palabras.length ; i++){
        			System.out.println("Dame una palabra");
            palabras[i]= scanner.nextLine();
        
        }
        String frase= "";
        for (int i=0; i<palabras.length;i++) {
        	frase= frase + palabras[i];
        
        }
		
    	System.out.println(frase);
    	
		scanner.close();
		
		
		
	}

}
