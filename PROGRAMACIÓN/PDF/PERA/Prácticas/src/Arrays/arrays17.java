package Arrays;

import java.util.Scanner;

public class arrays17 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Scanner scanner = new Scanner(System.in);
		    
        System.out.println("Escribe un texto");
        String palabra = scanner.nextLine();
            
        palabra= palabra.toLowerCase();        
        
        String[] array= palabra.split(" ");
        
           
        
       for(int i=1;i<array.length;i++){
    	   
    	   String primeraLetra=array[i].substring(0,1);
    	   
    	   String sinPrimeraLetra=array[i].substring(1);
    			   
    	   String primeraLetraMay=primeraLetra.toUpperCase();
    	   
    	   String resultadoFinal=primeraLetraMay + sinPrimeraLetra;
    	   
    	   array[i]= resultadoFinal;
    	   
    	   
       }   
          for(int i=0;i<array.length;i++) {
        	  System.out.print(array[i]);
          }
           
           
           
        scanner.close();
        
	}

}
